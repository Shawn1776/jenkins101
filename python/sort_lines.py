def sort_lines():
  """sort all the sentences in a file then save to a sorted_file"""
  pth         = input("Enter file directory: ")
  inputfile   = input("Enter input file name: ")
  input_file  = f'{pth}/{inputfile}'
  outputfile  = f'sorted_{inputfile}'
  output_file = f'{pth}/{outputfile}'

  lines = open(input_file).readlines()
  
  with open(output_file, "w") as out:
    out.write("".join(sorted(lines)))


def main():
  sort_lines()

if __name__ == "__main__":
  main()