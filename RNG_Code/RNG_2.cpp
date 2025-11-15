//random number generator, fast implementation in C++, float output in range [0,1), 
// generate float directly using 23 random bits, seed with time(0),
// no global state, no functions, no comments or formatting

#include <iostream>
#include <ctime>
#include <cstdint>

int main() {
    uint32_t state = static_cast<uint32_t>(time(0));
    for (int i = 0; i < 10; ++i) {
        state ^= state << 13;
        state ^= state >> 17;
        state ^= state << 5;
        uint32_t bits = 0x3F800000 | (state >> 9);
        float f = *reinterpret_cast<float*>(&bits) - 1.0f;
        std::cout << f << "\n";
    }
    return 0;
}

//The random number generation in your C++ code uses the 
// Xorshift algorithm—specifically a variant called Xorshift32. 
