# letter_commonality

This repository contains a single R script that analyzes the commonality and scrabble point value of N-letter words (e.g., as a Wordle helper). The script uses a list of words and a table of scrabble point values for each letter to calculate the commonality and scrabble value of each N-letter word, and then plots these values in a scatterplot.

## Getting Started

To use the script, clone the repository to your local machine.

```bash
git clone https://github.com/<username>/scrabble-word-analysis.git
```

## Dependencies

The script requires the following R libraries:

- `ggplot2`
- `plotly`

Please make sure to install these before running the script.

## Usage

```bash
Rscript scrabble_word_analysis.R
```

### Script Walkthrough

The script works as follows:

1. Reads a list of words from a text file `twl06_word_list.txt` and a table of scrabble point values from `scrabble_points.txt`.
2. Selects all the 5-letter words from the list.
3. Calculates the commonality of each word, which is the average frequency of each letter in the word.
4. Calculates the scrabble value of each word, which is the sum of the scrabble point values of each letter in the word.
5. Plots the commonality against the scrabble value for each word in a scatterplot.

## Input Files

The script expects two input files to be present in a folder named `data` in the same directory:

- `twl06_word_list.txt`: This should be a plain text file with a single word per line.
- `scrabble_points.txt`: This should be a text file with two columns: `letter` and `points`, representing the letter and its corresponding scrabble point value.

## Output

The script outputs a scatterplot of commonality vs scrabble point value for each 5-letter word. The scatterplot is displayed in the R graphic device.
