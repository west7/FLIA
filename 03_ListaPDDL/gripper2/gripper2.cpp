#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct ball {
    string name;
    string start_room;
    string end_room;
};

int main()
{
    ofstream file("gripper2-problem.pddl");
    if (!file.is_open()){
        cerr << "Error opening the file aaaaaa\n";
        return -1;
    }

    int S, B;
    cin >> S >> B;

    vector<string> rooms(S);
    vector<ball> balls(B);

    for (auto i = 0; i < S; i++)
        cin >> rooms[i];

    for (auto i = 0; i < B; i++)
        cin >> balls[i].name >> balls[i].start_room >> balls[i].end_room;

    file << "(define (problem problemagarra) (:domain gripper-typed)\n";
    file << "(:objects\n";
    for (auto r : rooms) {
        file << r << " ";
    }
    file << " - room\n";
    for (auto b : balls) {
        file << b.name << " ";
    }
    file << " - ball\n)";
    file << "(:init\n";
    file << "(at-robby " << rooms[0] << ")\n";
    file << "(free left) (free right)\n";
    for (auto b : balls) {
        file << "(at " << b.name << " " << b.start_room << ")\n";
    }
    file << ")\n";

    file << "(:goal (and \n";
    for (auto b : balls) {
        file << "(at " << b.name << " " << b.end_room << ")\n";
    }
    file << ")))\n";

    return 0;
}