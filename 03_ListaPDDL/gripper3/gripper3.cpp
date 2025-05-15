#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <unistd.h>
#include <cstdio>

struct ball_t
{
    std::string name;
    std::string start_room;
    std::string end_room;
};

void write_pddl_prbl(std::vector<std::string> rooms, std::vector<ball_t> balls)
{
    std::ofstream file("problem.pddl");
    if (!file.is_open())
    {
        std::cerr << "Erro ao criar o arquivo problem.pddl\n";
        exit(1);
    }

    file << "(define (problem problemagarra) (:domain gripper-typed)\n";
    file << "(:objects\n";
    for (auto r : rooms)
    {
        file << r << " ";
    }
    file << " - room\n";
    for (auto b : balls)
    {
        file << b.name << " ";
    }
    file << " - ball\n)";
    file << "(:init\n";
    file << "(at-robby " << rooms[0] << ")\n";
    file << "(free left) (free right)\n";
    for (auto b : balls)
    {
        file << "(at " << b.name << " " << b.start_room << ")\n";
    }
    file << ")\n";

    file << "(:goal (and \n";
    for (auto b : balls)
    {
        file << "(at " << b.name << " " << b.end_room << ")\n";
    }
    file << ")))\n";
}

void write_pddl_dm()
{
    std::ofstream file("domain.pddl");
    if (!file.is_open())
    {
        std::cerr << "Erro ao criar o arquivo domain.pddl\n";
        exit(1);
    }

    file << R"(
    (define (domain gripper-typed)
   (:requirements :typing)
   (:types room ball gripper)
   (:constants left right - gripper)
   (:predicates
    (at-robby ?r - room)            ;; O robô está em uma sala
    (at ?b - ball ?r - room)        ;; Uma bola está em uma sala
    (free ?g - gripper)             ;; A pinça está livre
    (carry ?o - ball ?g - gripper)) ;; Uma pinça está segurando uma bola

   (:action move
       :parameters  (?from ?to - room)
       :precondition (at-robby ?from)
       :effect (and  (at-robby ?to)
             (not (at-robby ?from))))

   (:action pick
       :parameters (?obj - ball ?room - room ?gripper - gripper)
       :precondition (and (at ?obj ?room) (at-robby ?room) (free ?gripper))
       :effect (and (carry ?obj ?gripper)
            (not (at ?obj ?room))
            (not (free ?gripper))))

   (:action drop
       :parameters (?obj - ball ?room - room ?gripper - gripper)
       :precondition (and (carry ?obj ?gripper) (at-robby ?room))
       :effect (and (at ?obj ?room)
            (free ?gripper)
            (not (carry ?obj ?gripper)))))
)";
}

int main()
{
    if (chdir("/tmp") != 0)
    {
        std::cerr << "Erro ao mudar diretório de trabalho.\n";
        exit(1);
    }

    int S, B;
    std::cin >> S >> B;

    std::vector<std::string> rooms(S);
    std::vector<ball_t> balls(B);

    for (auto i = 0; i < S; i++)
        std::cin >> rooms[i];

    for (auto i = 0; i < B; i++)
        std::cin >> balls[i].name >> balls[i].start_room >> balls[i].end_room;

    write_pddl_dm();
    write_pddl_prbl(rooms, balls);

    std::string cmd = "/tmp/dir/software/planners/downward-fdss23/fast-downward.py --alias seq-opt-fdss-2023 --overall-time-limit 10s domain.pddl problem.pddl > /dev/null";

    int result = system(cmd.c_str());
    if (result != 0)
    {
        std::cerr << "Erro ao executar o planejador\n";
        exit(1);
    }

    std::ifstream plan_file("sas_plan");
    if (!plan_file.is_open())
    {
        std::cerr << "Erro ao abrir o arquivo do plano\n";
        exit(1);
    }

    std::string line;
    while (std::getline(plan_file, line))
    {
        std::cout << line << '\n';
    }

    return 0;
}