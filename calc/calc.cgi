#!/usr/bin/ruby
  
 require 'cgi'
 
 def html_header
   return <<-EOF_HEADER
Content-type: text/html


   <html>
   <head>
    <title>simple calculator</title>
   </head>
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

 elsif exp.include?("/0")
   msg = 'Error: division by zero'
   content << msg << html_form
 
 elsif exp =~ /\A[\d\/*+-]+\z/
   # got user input
   msg = eval exp
   content << msg << html_form
 
 else
   # invalid input
   msg = 'invalid expression.'
   content << msg << html_form
 end
 
 content << html_footer
 
 print content.join