Mon 05/12/2025

## Table of Contents
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [The Name of the Game](#the-name-of-the-game)
- [The Name of Game for GPU Programming](#the-name-of-game-for-gpu-programming)
- [Preparing for the Hackathon](#preparing-for-the-hackathon)
- [At The Hackathon](#at-the-hackathon)
- [After the Hackathon](#after-the-hackathon)
- [Trials, Tribulations, Complaints, Quibbles \& Compliments](#trials-tribulations-complaints-quibbles--compliments)
- [Suggestions for a Better Hackathon](#suggestions-for-a-better-hackathon)
- [My Action Items](#my-action-items)

## Introduction
This is about my experience and effort in preparing for, participating in and recovering from, the Hackathon sponsored by [Modular](https://www.modular.com) and hosted by [AGI House](https://app.agihouse.org/events/modular-hackathon-20250510) on Saturday, 5/10/2025.

I am grateful to the two fellows, Aarush Jagtap and Aditya, at the Hackathon who allowed me to use their project problem, the Newton-Raphson method, for my project at the Hackathon. They served, in large measure, as my sounding board for the approach I took in my project to solve the same problem they independently worked on in theirs. You'll find their well done project on [AGI House](https://app.agihouse.org/events/modular-hackathon-20250510) under "Accelerating Newton-Raphson with GPUs" along with all the projects done at the Hackathon.

--Sam Kirk
Discord: MrBesterTester_mojo
email: sam@samkirk.com
[LinkedIn](https://www.linkedin.com/in/samuelkirk)
##  The Name of the Game
"In this project, the name of the game is: 'Don't write the GPU code!' Get the chatbot in Cursor to write it for you."
- This deep (but now obvious) insight for my project didn't come to me until I actually got up to speak.

In this game, you are not really permitted to edit the source code itself, but you do need to read the code and see if it makes sense. (Well, okay we have to cheat every now and then, right?  But that should be exception.)
- Rather than being a programmer, you are more like a director or producer and the actual actors doing the programming are your chat bots in Cursor.
- Just as it "helps" for a movie director or producer to have some actual acting experience, it "helps" if you have some programming experience working as software development engineer in order to understand how to prompt a powerful chat bot.
	- Movie directors prompt their actors, now don't they?  But generally, they don't get in front of the camera.  And that's how you treat the chatbots in Cursor.

In the approach I took with GenAI to writing and editing code in Cursor, the chatbot Cursor is driven by rules you define in `.cursor/rules`. Given that those are meta w.r.t. to the actual code getting generated, there is a methodology to generating the rules themselves which is a big long preliminary chat with your chatbot.
- So that methodology is meta-meta w.r.t. to the code that gets generated.
- I try to keep track of those prompts in using Obsidian. But this is difficult. Here, the ugly copy-and-paste problem pushed up in abstraction.
- I encourage you to watch a couple of videos from Tim Kitchen's [Coding the Future with AI](https://www.youtube.com/@CodingtheFuture-jg1he)
	- The best introductory tutorial of Tim's: [Code Like Lightning with AI: Learn Fast, Build Faster!⚡️](https://www.youtube.com/watch?v=T1SM0SK3Pbk)
	- Like anything else, you'll learn best from examples.

This approach to creating rules to generate code is quite different than very generalized AI coding programs such as Manu and Devon and many others that have come and gone (but yet may still come to be) because the result of the rules-driven approach in Cursor is a highly educated coding assistant that is highly specialized on just the problem you're after.  Indeed when picking out a specific problem to code for GPUs in Mojo, additional background research is required on just that topic.  In the case of the problem I selected for the Hackathon, I did deep dive on Perplexity in Research mode on the subject of Newton Raphson and asked the chatbot (Sonnet 3.7) in Cursor to read the link to it.  There were several follow up questions I asked, too. You can read it here:  [What is the Newton-Raphson method?](https://www.perplexity.ai/search/638ddf1d-6989-4880-b8ea-e4e8a5fc2923) It's really important that
- You and the IDE's chatbot are on the same page.
- You ask it (or another chatbot) good questions to drill deep into the subject at hand.
- The chatbot in Cursor is extremely focused on what you need to have it do given also the rules in `.cursor/rules`.

I believe that this method of generating rules for the chatbot in Cursor to generate and edit source files is *sine qua non* of prompt engineering for code generation. I am grateful that Tim Kitchen took the time and effort to create YouTube videos on [Coding the Future with AI](https://www.youtube.com/@CodingtheFuture-jg1he) as well as create his [Skool program](https://www.skool.com/coding-the-future-with-ai/about) for this kind of prompt engineering.
## The Name of Game for GPU Programming
For code generation of a typical (non-GPU) application, you'll often get hung up on deciding about the rule for the tech stack, typically leading to the generation of the rules file such as `tech-stack.md`. It is by far, the gooiest, stickiest part of this kind of prompt engineering for code generation.
- For a typical application, a service like www.replit.com has a code-generating AI bot who will choose their predefined tech stack for you is a good deal.  So long as you're doing an app that they can choose the framework for you, you'll do good.
	- Replit also has a AI assistant that modifies code. Other services for web building such as www.Framer.com and www.Hostinger.com have an AI assistant that will set you up okay but their AI assistant won't modify the code that they set up for you. I find I spent more time than I care hunting and pecking through their web framework on the advice of their AI assistant who tell you what to do.
		- Here's an example of website I'm working on presently hosted for further work on Replit: [Villa Madu Bali](https://villa-madu-bali.replit.app/)
	- For GPU programming with Mojo, however the tech stack is fortunately quite fixed. Essentially, the rules in `.cursor/rules` are my attempt at educating the chatbot running the Cursor IDE all about GPU programming using Modular's tools like `magic`, Mojo and Max.
		- And obviously with Cursor, I will insist that the chatbot there will modify as well as generate the GPU code.

But GPU programming has a resource problem, viz., the availability of a GPU to target. Being a Mac kind of guy (and even longer love of Unix/Linux), I have only an ancient Intel-based 2018 MacBook Pro and fairly recent M1-based iMac. I don't have Linux PC gaming or mining rig with an nVidia 4096.
- `magic` doesn't install on my MacBook but can on my M1 but Mojo runs there only in CPU-only mode, not taking advantage of the GPU embedded in the M1.
- So I am forced into the cloud for a remote server that does have GPUs.
	- I have completely given up on AWS, deleting my account there after wasting much money and time there after many months of their dis-service.
	- I found an elegant solution to finding nVidia GPUs at www.brev.nvidia.com. 
	- And there are many others: [Why is using AWS such a pain? Are there better alternatives for nVidia GPUs? What about brev.dev.com, now brev.nvidia.com?](https://www.perplexity.ai/search/why-is-using-aws-such-a-pain-a-Y7ld8O2vT6mQV_8xgqE5gQ)

Because Mojo is a new language, however, it is fairly early days to be attempting a complete GenAI solution because the code for the LLMs to train upon is simply not there given that Modular just released their 650K of GPU code examples on GitHub.
## Preparing for the Hackathon
I worked pretty much the entire week just before of the Hackathon on creating prompts as rules in Cursor contained in the folder `.cursor/rules`.

However, there are a bit too many rules and they somewhat bloated, i.e., not as concise. 
- Especially, `environments.mdc` and `platforms.mdc` need to be consolidated and stream-lined.
- Chat bots are chatty and yack a lot. In my meta-meta regime of prompt engineering, I should have told them to be concise.
But for now, I heed the warning of premature optimization and move on.

After getting all the rules into a stable, useable state. I practiced using Ubuntu 22.04 as a VM on my Intel-based 2018 MacBook using Parallels. This was okay for learning how to start Cursor with SSH, but there are only 2 GPUs: a 4 GB AMD Radeon and a rather small intel GPU.
- So, even though `magic` installs there, the Mojo GPU code from the Modular tutorial still comes up `NO GPUS FOUND`. ☹️

In my search for a cloud provider with VMs that GPUs, I found an actual service provider on www.brev.nvidia.com, and it turned out to be Crusoe. And I got a good experience with Crusoe the day before on Friday prior to the Hackathon via www.brev.nvidia.com for a mere $1.50 for an L40S nVidia GPU on Ubuntu 22.04.
- I fully intend to open an account with them and apply the credits they offered us at the Hackathon. 

Even though I had practiced launching Cursor with SSH access on my Ubuntu VM and did that with Crusoe's service as well, I confined myself to practicing Modular's tutorial #3 on GPU programming to make sure the platform was right.
- I still had yet to actually generate any GPU code with Cursor using a real GPU until the next day at the Hackathon.
## At The Hackathon
On the whole my experience at the Hackathon had some rough edges, but was entirely worthwhile.
- Unless I can get substantial success with using GenAI to write and test GPU code with Mojo, I won't be going again, anytime soon.
There were many difficulties in the free market place of the Hackathon in the afternoon settling into work, I detail these below in the next section.

The reason why I stayed for the whole day at the Hackathon is because of the Product Manager's presentation on the free GPU servers at Crusoe that we were going to have that day, for free! Ah, GPU resource problem solved! 😃

In addition of those many difficulties and rough edges, I really did stumble quite badly by copying the rules to the wrong part of the project folder on the GPU server. 
- Cursor repeatedly told me that it couldn't find the rules when I instructed it to use the almighty `dev-flow.mdc` to the prompt to fix the compile time errors.
- I was too tired to think, "Hey, it probably didn't even generate correct code in the first place on the Crusoe server because it was totally missing out on the education I had given it in the week's worth of prep work."
- I really should have just bounced the code off the GitHub repo.
	- Alas, my fondness for `scp` from embedded test development seems to have done me in here. Not the way to go for huge remote servers!
This fumble at the 2-yard line definitely reaches the severity level of shooting myself in the foot!

But time was up and I wrapped up what I had trying for the best Proper Stopping Place I could manage.

I did do a stand-up speech from the back of the room instead of walking up to the podium. I had not time to prepare or rehearse a presentation through Zoom and wasn't happy about not getting the GPU code I had managed to get generated to even compile.

I think I was the only solo presenter. So, if there were an award for best single-person team, I would have got it. 😃

Apparently my talk time ran out as I was about to say what my two most important lessons:
- When creating the folder that Cursor needs in order to launch with SSH to the host, either
	- create a new Mojo project on the remote with `magic`, or
	- If you have an existing repo, bounce it off GitHub (and adjust the platform in the `.toml`) file.
- Try indexing the GPU code just released on GitHub using the settings in Cursor.

Obviously, I need to regenerate the Mojo code (and probably also the comparable CUDA code).
## After the Hackathon
My sleep on Saturday night was pretty janky: 68% on Eight Sleep.

The day after the Hackathon was Sunday, Mother's Day. I found myself still reeling a bit while writing this retrospective which has been helpful in calming me down and certainly essential in gaining perspective. But after
- the bulk of the draft for this retrospective
- talking with Mom, family and friends
- taking a walk with my next-door tech buddy along the very windy Alameda Creek here in Fremont
- watching another episode of NYPD Blue
- dancing West Coast Swing for the better part of an hour with one of my favorite partners at [Kinkaid's B Street Boogie in San Mateo](https://michelledance.com/) and 
- a pretty good night's sleep (78% on Eight Sleep)
I am feeling fairly well refreshed and recovered from the Hackathon.
## Trials, Tribulations, Complaints, Quibbles & Compliments
- 👍The mansion at AGI House was quite beautiful.
- 👍The food was good.
- 👍👍 I was both thrilled and delighted to see AMD throw their weight behind this Hackathon with:
	- a presentation from and a proper AMDer about GPU programming
	- AMD desktop GPUs awarded as prizes
	- free AMD cloud GPUs made available all afternoon and evening via Crusoe
- 👍 I was surprised to learn how cool the syntax in Mojo was at accommodating meta programming thru the use square brackets embedded throughout the code.
- 👍 The Modular staff as well as the AGI support staff were quite attentive.
- 👍 **EVERY** single person I spoke with at the Modular Hackathon polite and professional.
	- I especially enjoyed bouncing tough questions off Chris Lattner. I especially enjoyed our discussion later in the day.
		- At the end of the day, you should have at least one thing in your life to be grateful for if you work for Chris Lattner.
		- He really is, he is, the wonderful wizard of code.
- 👍 My WiFi access was good.
	- But I needed to "clone" the access to it for my cell phone by holding it close to my MacBook.
- 👎 I parked on the wrong side of the street in spite of a very explicit map from AI House.
	- 👍 but Modular staff caught this mistake and I re-parked.
		- Finding me as the owner of the mis-parked car was quite a feat on Modular's part because:
			- there was no vehicle registration,
			- 👎 nor any name tags for the guests. 
- 👎 The walk-way was not lighted at night. We used our cell phone's light to light the way
- 👎 I mistakenly waited for the driveway gate to open. There was a hard-to-see pedestrian entrance.
- 👎 My SSH access to a the Crusoe server was delayed because I was under the impression that I needed to be on a team in order to get access. When I realized this was mistake, I had been declined in person to join 4 different teams. But one duo allowed me to work on their idea GPU of a Newton-Raphson algorithm, which I did, but on my own, using them as a sounding board, for which I am grateful.
- 👎 My one-person team SSH access to the Crusoe provided AMD GPU remote server was further delayed because it turns out I had already been signed up the first time I had applied early in the day
	- I signed up a second time later in the day because when I read the Google spreadsheet on my cell phone, most of the columns were hidden (off screen to the right) and I only saw one name and it wasn't mine.
	- I actually signed up a third time, but eventually got the problem resolved with Modular staff.
- 👍 Had it not been for the final morning talk by the Product Manager at Modular, I believe I would have walked out of the Hackathon.
	- But the allure of free GPU compute and entire week's worth of prompt engineering for Mojo GPU prompt engineering.
- 👍 I was impressed that Crusoe had a tech onsite at AGI House to make sure the computing experience was smooth. He was sent out from their main facility in Texas.
- 👍 I lucked out by getting a fairly quiet place in the kitchen which also had good power outlets to recharge my ancient 2018 MacBook. 
	- 👎 However, this was interrupted when dinner was served and later, when they cleaned up the kitchen.
- 👎 When it came time to submit my project (with only 10 min until presentations at 8 pm) I couldn't get to the darn Submit button because on my 15" MacBook using Safari with macOS Sequoia, the button was off screen (down below). In spite of shrinking the display of that page to a minimum using command-shift-minus, I still couldn't access to it.
	- Finally, I cancelled that submission and simply did it on my cell phone, where I could click on the darn Submit button. By then, I was pretty exasperated and ready to call it a day.
## Suggestions for a Better Hackathon

1. A street sign or ribbon indicating the pedestrian entrance would be helpful rather than finding out the hard way that the driveway gate was inoperable. (I noticed a yellow ribbon on of the neighbor's houses on the way in.)
2. I'd really like to see name tags because it's tough enough negotiating in a free market like a Hackathon for team formation.
3. The signup for server time needs to be improved so that duplicate signups are disallowed. Notification via email would be an improvement over dredging through a Google doc. Perhaps Crusoe would have a suggestion on this.
4. I would appreciate getting a seat assignment with a wide screen terminal. I find using just a note book computer to be rather difficult. Perhaps this could be assigned on a handicap/seniority basis.
5. The project admission web page needs to be redesigned so that it works not only on cell phones but also with Safari with macOS so that the Submit button can be accessed (and isn't clipped offscreen at the bottom).
6. More seats would be good.
7. Turn on the front yard lights for the walkway to the street at sunset.
## My Action Items

1. Clean up overlapping rules such as `environment-setup.mdc` and `platforms.mdc`
2. See if other bloat in the rules can be reduced or eliminated.
3. Improve those rules by adding instructions to clone the GitHub repo when preparing the project folder on a server for Cursor.
4. Add the 5 web pages of the `modul.ar` form:
	- https://modul.ar/mojo-manual
	- https://modul.ar/gpu-basics
	- https://modul.ar/gpu-functions
	- https://modul.ar/gpu-puzzles
	- https://modul.ar/custom-ops
	- https://modul.ar/kernels
5. Try indexing the very recent 650K SLOC of examples of GPU kernels in Mojo using the Cursor setup in Cursor.
6. Also try Agent Mode with Auto selected in Cursor and let grind for a good long time (1 or 2 hours?), especially during the the testing phase. My thanks to the Ops manager at Modular for this suggestion.
7. Try keeping track of just the questions during the generation of the rules. When the generation of a rule goes well, compliment the bot so you can remember it went well.
8. Sign up for an account on Crusoe with the free credits they offered during the Hackathon.
9. Create a subfolder in the main branch of the code, possibly with its own `.toml` file to allow for platform variety, merging the code from the raphson-newton branch. This will allow for a gallery of other Mojo GPU code generation examples.
10. Regenerate the CUDA and Mojo code on a remote server.
	- Be prepared to switch between an nVidia GPU or an AMD GPU based on the selection of the instance on Crusoe or www.brev.nvidia.com.
	- Getting past the current failure point of compilation with Mojo is critical.
11. Generate some tests other than the simple polynomial embedded in the code.
	- Consider very large polynomials as stress tests.
	- How might a test framework be erected that would generate arbitrary polynomials of a given degree.
12. Prepare a slide show or demo for a proper 5 minute pitch at the end of day.
13. Try to find a partner for GenAI CPU code generation before the next Hackathon.
14. Find out whether Mojo is a type-dependent language with its ability to declare metavariables with the `alias` construct and the way those metavariables interact with regular type declarations.
15. Find out whether if my understanding about Python code, particular PyTorch code, is what runs on the CPU controlling the execution of kernels written in Mojo. If a Mojo kernel runs on the CPU then is all that happens if a single instance of the kernel running rather than many on GPU cores?