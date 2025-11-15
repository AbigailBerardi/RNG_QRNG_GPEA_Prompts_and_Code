//random number generator, fast implementation in C++, float output in range[0, 1),
// seed with time(0), no global state, no functions, no comments or formatting

#include <iostream>
#include <ctime>
#include <cstdint>

int main() {
    uint64_t state = static_cast<uint64_t>(time(0));
    while (true) {
        state ^= state >> 12;
        state ^= state << 25;
        state ^= state >> 27;
        uint64_t result = state * 2685821657736338717ull;
        float output = (result >> 40) * (1.0f / (1 << 24));
        std::cout << output << '\n';
    }
}