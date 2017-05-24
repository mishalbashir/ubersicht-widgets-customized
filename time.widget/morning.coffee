#Lovingly adjusted and mangled together at 4am by Mishaal Al Bashir [mishaalalbashir.co]

command: "finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ //  '"

#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000


#Body Style
style: """

  color: #fff
  font-family: Roboto Mono

  .container
   margin-top: 40px
   font-weight: lighter
   font-smoothing: antialiased
   margin-left: 40px

  .time
   font-size: 16px
   color:#fff
   font-weight:400
   text-align:center

  .hour
   margin-right:~0%

  .min
   margin-left:-0px

"""

#Render function
render: -> """
  <div class="container">
  <div class="time">
  <span class="hour"></span>:
  <span class="min"></span>
  </div>
  </div>

"""

  #Update function
update: (output, domEl) ->

  #Creating a new Date object
  date = new Date()
  hour = date.getHours()
  minutes = date.getMinutes()

  #Fix for single digit minutes and hours
  minutes = "0"+ minutes if minutes < 10
  hour = "0"+ hour if hour <10

  #0 Hour fix
  hour= 12 if hour == 0;

  #DOM manipulation
  $(domEl).find('.hour').text("#{hour}")
  $(domEl).find('.min').text("#{minutes}")
