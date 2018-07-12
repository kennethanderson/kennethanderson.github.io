BEGIN {
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

  LINENUM = 1
}

# %% delineates muli-line records
$1 ~ /%%/ {
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
  if (TEXT) {
    print TEXT
  } else {
    print "Error (line " LINENUM "): text missing!" > "/dev/stderr"
    exit 1
  }
  if (IMAGE) {
    print "    <img src=\"" IMAGE "\" alt=\"\">"
  }
  print "  </section>"
  print ""
  EOR=1; 
}

{
  if (EOR) {
    #debug
    #print "==> ANCHOR=" ANCHOR "==="
    #print "==> TITLE=" TITLE "==="
    #print "==> IMAGE=" IMAGE "==="
    #print "==> TEXT=" TEXT "==="
    # reset
    ANCHOR="";
    TITLE="";
    IMAGE="";
    TEXT="";
    INTEXT=0;
    EOR=0;
  }
  else if ($1 == "anchor:") {ANCHOR=substr($0, 9);}
  else if ($1 == "title:" ) {TITLE=substr($0, 8);}
  else if ($1 == "image:" ) {IMAGE=substr($0, 8);}
  else if ($1 == "text:"  ) {TEXT=substr($0, 7, length($0)-8); INTEXT=1;}
  else if (INTEXT) {
    if (!TEXT) {TEXT = $0;}
    else       {TEXT = TEXT "\n" $0;} # concatenate
  }

  LINENUM = LINENUM + 1
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
