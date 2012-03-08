messages =
    notes: 175
    start: 250
    timing: 248
    continue: 251
    stop: 252

midi = require 'midi'
midiIn = new midi.input

midiIn.getPortCount()

console.log 'Listening on: ' +  midiIn.getPortName 0

midiIn.on 'message', (deltaTime, message) =>
    msg  = parseInt  message[0],10
    if msg < ++messages.notes
        console.log 'Midi note: ' + parseInt  message[1],10
    if msg == messages.stop
        closeMidiPort()
        
midiIn.openPort 0

midiIn.ignoreTypes true, true, true

closeMidiPort = -> 
    midiIn.closePort()
    console.log 'done'
    process.exit(0);

setTimeout closeMidiPort, 1000000000