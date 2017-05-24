#Lovingly adjusted and mangled together at 4am by Mishaal Al Bashir [mishaalalbashir.co]


command: "pmset -g batt | grep -o '[0-9]*%; [a-z]*'"

refreshFrequency: 30000

style: """
  top: 40px
  left: 125px
  color: #fff
  font-family: Roboto Mono

  .percent
    font-size: 16px
    opacity: 0.7
    margin: 0

"""

render: -> """
  <p class='percent'></p>
"""

update: (output, domEl) ->
  values = output.split(";")
  percent = values[0]
  status = values[1]
  div     = $(domEl)

  div.find('.percent').html(percent)
  div.find('.status').html(status)
