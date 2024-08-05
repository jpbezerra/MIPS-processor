#include <bits/stdc++.h>

using namespace std;

int changeMusic(int index) {
    return index + 1;
}

int main() {
    int time = 4;
    int musics[] = {1, 2, 3, 4, 5, 6, 7, 8};

    int currMusic = musics[0];
    int index = 0;
    bool over = 1;

    while (over == 1) {
        time--;

        if (time == 0) {
            cout << currMusic << " ";

            index = changeMusic(index);
            currMusic = musics[index];
            time = 4;

            if (currMusic == musics[7]) {
                over = 0;
            }
        }
    }

    cout << currMusic;

    return 0;
}