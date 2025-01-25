/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean *
 - Variable assignment *
 - Printing variables *
 - Variable checking *
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
Variable Checking! 

Equality: "Spot" == "Spot"
Not equality: 1 != 2
Greater: >
Less: <
Greater or equal: >=
Less or equal: <=

 
 
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What is your pet's name?

* [Charlie] 
    ~  pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth
* [Jim]
    ~ pet_name = "Jim"
    -> cave_mouth
* [Bob]
    ~ pet_name = "Bob"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now! { pet_name == "Bob": While bob would just be tired and fall asleep. He loved his naps and still a great companion.| }

You have {torches} torch

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. You can't see anything, but a tall dark figure staring down at you with glowing red eyes.
{ pet_name == "Spot": Scout would love it here in the west| }
* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
{ pet_name == "Susan": Susan would have loved driving into these coins. She always loved shiny things| }
{ pet_name == "Charlie": Charlie is amazed but the mutiple shiny things in front on him.| }
You take as much as you can before heading back. 
* [Go Back] -> cave_mouth_packed
-> END

== west_tunnel_lit ==
You now see a magic golem standing tall infront of you, staring down at you with glowing red eyes.
{ pet_name == "Charlie": Charlie would have run up to the golem wanting to play..... He always loved meeting new people.| }
{ pet_name == "Jim": Jim would have hid behind me, he was always scared of new people and unfamiliar places.| }
The golem speaks to you. Golem: "Who dares invade my master's territory! Leave now or pay the price!"
*[You run back to the entrance] -> cave_mouth_lit
*[speak to the golem] -> conservation_with_golem
-> END

== conservation_with_golem ==
You ask the golem to let you explain. The golem lets you speak but warns you not to lie
*[You lie] -> golem_attacks
*[You tell the truth] -> continue_talking
-> END

== golem_attacks==
The golem strikes at you
{ pet_name == "Jim": Jim would have been scared but try to help.| }
+ [dodge] -> evade_golem
-> END

== evade_golem ==
You evade the attack and you run out
*[Go Back] -> cave_mouth_lit
-> END
== continue_talking ==
You tell the golem how you entered a cave that let you here. The golem seems surprised as you speak. He tells you that there was once a large castle and that this was his master's dungeon where he stood guard
*[you continue to speak] -> continued_talking
-> END

== continued_talking ==
You explain that centuries have passed and that his master has likely long died. The golem looks sad but accepts it. { pet_name == "Charlie": Charlie tries to comfort the golem, which the golem thanks him for.| } He tells you to go back to the entrance and take the east entrance there you will find his master's treasure. You nod, thank him.
*[Go to the east] -> east_tunnel_lit
-> END

== cave_mouth_packed ==
I'm heavy with the teasure I collected. I head home, planning on coming back for the rest.
-> END

== cave_mouth_lit ==
+ [Take the east tunnel] -> east_tunnel_lit
+ [Take the west tunnel] -> west_tunnel_lit
