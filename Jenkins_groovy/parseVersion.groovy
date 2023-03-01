def parseVersion(release_name) {
  println(release_name)
  def re = ( release_name =~ /^\w+-(\d+)/ ) // have to be Adam-10 or Adam-10.1 can not be Adam.10-1 or Adam01-1 // /^\w+-(\d+) can not have any white space...
  // def re = release_name
  def match = re[0]
  //println(match)
  println(match[1])
  println(match[0])
  println(match[2])
  println("return: ")
  println(re[0])
  println(re)
  return match[1]
}

def version = parseVersion("Adam0-19d.1-1")
println(version) // Output: 1

/* 
( release_name =~ /^\w+-(\d+)/ ) is a regular expression pattern that is used to search for a specific pattern of characters within the release_name string. The regular expression pattern is composed of the following elements:

^ - This matches the start of the string. This is used to ensure that the pattern starts matching from the beginning of the string.

\w+ - This matches one or more word characters (letters, digits, or underscores). The + indicates that one or more characters must be matched.

- - This matches a hyphen character.

(\d+) - This matches one or more digits and captures them in a group. The parentheses are used to capture the matched digits as a group. The + indicates that one or more digits must be matched.

So, the regular expression pattern matches a string that starts with one or more word characters followed by a hyphen, and captures one or more digits following the hyphen. The =~ operator applies this pattern to the release_name string and returns a Matcher object that contains information about any matches found.

The Matcher object can be used to extract information about the matches found, such as the numeric version extracted in the parseVersion function.
*/