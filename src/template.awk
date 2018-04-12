BEGIN { 
  FS="\"";

  print "<!DOCTYPE html>"
  print "<html lang=\"en\">"
  print ""
  print "<head>"
  print "<meta charset=\"utf-8\"/>"
  print "<title>Ken Anderson</title>"
  print "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>"
  print "<link rel=\"icon\" type=\"image/x-icon\" href=\"favicon.ico\"/>"
  print "</head>"
  print ""
  print "<body>"
  print "<div id=\"container\">"
  print ""
  print "<div>"
  print "<header>"
  print "<nav>"
  print "<ul>"
  print "<li id=\"logo\"><a href=\"index.html\"><img src=\"images/favicon.png\" alt=\"\"/>Ken Anderson</a></li>"
  print "<li><a href=\"robotics.html\">Robotics</a></li>"
  print "<li><a href=\"ai.html\">Artificial Intelligence</a></li>"
  print "<li><a href=\"video.html\">Video/Image Processing</a></li>"
  print "<li><a href=\"publications.html\">Publications</a></li>"
  print "</ul>"
  print "</nav>"
  print "</header>"
  print "</div>"
  print "<div  class=\"clearfix\"></div>"
  print ""
  print "<div id=\"content\">"
  print 
}

{
  if (TEXT && !TEXTEND) {
    # concatenate multi-lines
    #print "match " match(TEXT, />"/) " " length(TEXT) ".." substr(TEXT, length(TEXT)-10);
    TEXTEND = match(TEXT, />"/);
    if (TEXTEND) {
      TEXT=substr(TEXT, 1, TEXTEND); # remove ending quote
      gsub(/\\"/, "\"", TEXT);   # convert quotes
      # print "E len " length(TEXT) ".." substr(TEXT, length(TEXT)-5);}
    } else {
      TEXT = TEXT "\n" $0;
      #print "a len " length(TEXT) ".." substr(TEXT, length(TEXT)-5); next;}
    }
  }
  if ($1 == "    anchor: ") {ANCHOR=$2; }
  if ($1 == "    title: " ) {TITLE=$2; }
  if ($1 == "    image: " ) {IMAGE=$2; }
  if ($1 == "    text: "  ) {TEXT=substr($0, 12); TEXTEND=0; next; }
  
  if (TEXT && TEXTEND) {
    #debug
    #print "==>ANCHOR=" ANCHOR
    #print "==>TITLE=" TITLE
    ##print "==>IMAGE=" IMAGE
    #print "==>TEXT=" TEXT
    if (IMAGE) {
      print "  <section class=\"hasimg\">"
    } else {
      print "  <section>"
    }
    if (ANCHOR) {
      print "    <a id=\"" ANCHOR "\" class=\"anchor\"></a>"
    }
    if (TITLE) {
      print "    <h1>" TITLE "</h1>"
    }
      print "    " TEXT
    if (IMAGE) {
      print "    <img src=\"" IMAGE "\" alt=\"\">"
    }
    print "  </section>"
    print ""
    # reset
    ANCHOR="";
    TITLE="";
    IMAGE="";
    TEXT="";
    TEXTEND=0;
  }
}

END {
  print "</div>"
  print ""
  print "<footer>Copyright &copy; Ken Anderson, 2007-2018</footer>"
  print ""
  print "</div>"
  print "</body>"
  print "</html>"
}
