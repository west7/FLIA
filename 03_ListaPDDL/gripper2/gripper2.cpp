#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct ball {
    string name;
    string start_room;
    string end_room;
};

int main()
{
    int S, B;

    cin >> S >> B;

    vector<string> rooms(S);
    vector<ball> balls(B);

    for (auto i = 0; i < S; i++)
        cin >> rooms[i];

    for (auto i = 0; i < B; i++)
        cin >> balls[i].name >> balls[i].start_room >> balls[i].end_room;

    

    return 0;
}