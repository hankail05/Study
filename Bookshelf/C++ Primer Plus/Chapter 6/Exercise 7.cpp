#include <cctype>
#include <iostream>

int main(int argc, char *argv[])
{
    std::string word = "";
    int vowel = 0, consonant = 0, other = 0;

    std::cout << "Enter words (q to quit):\n";
    while (true)
    {
        std::cin >> word;

        if (word == "q")
            break;

        if (isalpha(word[0]))
            switch (word[0])
            {
            case 'A':
            case 'E':
            case 'I':
            case 'O':
            case 'U':
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
                ++vowel;
                break;
            default:
                ++consonant;
            }
        else
            ++other;
    }

    std::cout << vowel << " words beginning with vowels\n"
              << consonant << " words beginning with consonants\n"
              << other << " others\n";

    return 0;
}
