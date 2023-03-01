def parseVersion(release_name) {
  println(release_name)
  def re = ( release_name =~ /^\w+-(\d+)/ ) // have to be Adam-10 or Adam-10.1 can not be Adam.10-1 or Adam01-1
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

