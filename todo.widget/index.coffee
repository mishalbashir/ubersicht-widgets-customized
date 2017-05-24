#Lovingly adjusted and mangled together at 4am by Mishaal Al Bashir [mishaalalbashir.co]
#to use this, create a file called "ToDo.list" in your MacintoshHD/Users/*Username* folder

refreshFrequency: 600000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
# Use a '=' for a new list
todolistfile = '~/ToDo.list'

command: "cat #{todolistfile} | awk 'BEGIN {} /^[=]/ {print \"</ul></div> <div class=\\\"block\\\"><h>\"substr($0,2)\"</h><ul>\"} /^[-]/ {print  \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ul>\"} '"

style: """
  top: 100px
  left: 40px
  color: #fff
  font-family: Roboto Mono

  h
    margin-left: 0px
    font-size: 18px
    opacity: 0.7
    font-weight: 400
    font-family: Inconsolata
    letter-spacing: 2px

 .block
    display: inline-block
    padding-right: 50px
    font-size: 12px
    vertical-align:top

  ul
    padding-left: 0px
    list-style: none

  .completed
    opacity: 0.7
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <div>
    <div class="todolist"></div>
  </div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
