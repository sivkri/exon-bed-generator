# create_exon_bed

This script downloads a GTF file containing exon information for Homo sapiens, processes the file, and generates a BED file with exon coordinates.

## Prerequisites

- Bash
- wget
- zcat
- grep
- awk
- sortBed
- mergeBed

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/create-exon-bed.git
   ```

2. Change into the project directory:

   ```bash
   cd create-exon-bed
   ```

3. Make the script executable:

   ```bash
   chmod +x create_exon_bed.sh
   ```

4. Run the script:

   ```bash
   ./create_exon_bed.sh
   ```

   This will download the required GTF file, process it, and generate a BED file named `Homo_sapiens.GRCh38_exon.bed` in the project directory.

5. The generated BED file can be further used for downstream analysis or as per your requirements.

## Notes

- The script uses `wget` to download the GTF file, so an internet connection is required during execution.
- Ensure that the necessary dependencies are installed and accessible in your system's PATH.
- The script creates a temporary `tmp.bed` file during execution, which is automatically cleaned up at the end.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- This script utilizes various command-line tools to process and manipulate genomic data. The functionality is based on their respective documentation and usage guidelines.

Feel free to modify the README file to provide additional details or customize it according to your specific requirements.
