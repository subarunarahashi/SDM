#!/Ruby32-x64/bin/ruby

require 'cgi'

def html_header
  return <<-EOF_HEADER
Content-Type: text/html

  <html>
  <title>simple calculator</title>
  <body>
    input:<br>
EOF_HEADER
end

def html_lastinput
  return <<-EOF_LASTINPUT
    last input:<br>
EOF_LASTINPUT
end

def html_footer
  return <<-EOF_FOOTER
    <br> output:
EOF_FOOTER
end
 
def html_form
  return <<-EOF_FORM
  <form action="calc.cgi" method="post">
    <input name="exp" size="25" />
  </form>
EOF_FORM
end

################################################################
### main

content = []

params = CGI.new
exp = params['exp'].to_s

content << html_header
content << html_form

if exp =~ /^$/
  # initial state
  msg = ''

elsif exp.include?("/0")
  msg = 'Error: division by zero'

elsif exp =~ /\A[\d\/%*+-]+\z/
  # got user input
  msg = eval exp
   
else
  # invalid input
  msg = 'invalid expression.'
end

content << html_lastinput
content << exp
content << html_footer
content << msg

print content.join