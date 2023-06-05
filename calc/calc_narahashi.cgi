#!/usr/bin/ruby

require 'cgi'

def html_header
  return <<-EOF_HEADER
Content-Type: text/html

  <html>
  <title>simple calculator</title>
  <body>
   input:
EOF_HEADER
end

def html_footer
  return <<-EOF_FOOTER
  </html>
  </body>
EOF_FOOTER
end

def html_form
  return <<-EOF_FORM
  <form action="calc.cgi" method="post">
    <input name="exp" size="25" />
  </form>
EOF_FORM
end

def error_message
  error_content = []
  error_content << html_header
  msg = 'invalid expression.'
  error_content << msg << html_form
  return error_content
end



################################################################
### main

content = []

params = CGI.new
exp = params['exp'].to_s

content << html_header

if exp =~ /^$/
  # initial state
  msg = ''
  content << msg << html_form

elsif exp =~ /\A[\d\/*+-]+\z/      #/\A[\d\/*+-]+\z/
  if exp =~ /\A[\d\/*+-]*\d+[\/*+-]{2,}+\d*\z/  # +*などの演算子が二回続くとエラーメッセージを出力
     if exp =~ /\A[\d\/*+-]*\d+[*]{2}+\d+\z/   # a ** b : aのn乗
        msg = eval exp
        content << msg << html_form
     else
        content = error_message
     end
  # got user input
  else 
     msg = eval exp
     content << msg << html_form
  end

else
  content = error_message
end

content << html_footer

print content.join
