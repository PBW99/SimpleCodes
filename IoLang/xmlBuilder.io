XmlBuilder := Object clone
XmlBuilder depth := 0
XmlBuilder forward := method(
    executeArguments := List clone
    self depth repeat(write("  "));write("<", call message name)
    call message arguments foreach(arg, if(arg name =="curlyBrackets", self doMessage(arg), executeArguments append(arg)))
    writeln(">")

    self depth := self depth+1
    executeArguments foreach(arg, content := self doMessage(arg); if(content type =="Sequence", self depth repeat(write("  ")); writeln(content);))
    self depth := self depth-1

    self depth repeat(write("  "));writeln("</", call message name, ">")
)

XmlBuilder [] := method(
    self depth repeat(write("  "));writeln("<list>")

    self depth := self depth+1
    call message arguments foreach(arg, content := self doMessage(arg); if(content type =="Sequence", self depth repeat(write("  ")); writeln(content);))
    self depth := self depth-1

    self depth repeat(write("  "));writeln("</list>")
)
XmlBuilder {} := method(
    call message arguments foreach(arg, self doMessage(arg);)
)

Attribute := Object clone

Object colonAssign := method(
    write(" ", call evalArgAt(0) asMutable removePrefix("\"") removePrefix("\"") removeSuffix("\"") removeSuffix("\""))
    write("=\"",call evalArgAt(1), "\"")
    Attribute
)
OperatorTable addAssignOperator(":", "colonAssign")

doFile("xmlBuilderTest.io")

