Create a shell application to track a to-do list. Your application will

permit the user to add new to-do items and check off existing ones, each of which will consist of a title and possibly some additional text;
allow the user to display uncompleted and completed to-do items;
use an intuitive menu-driven interface;
provide a command-line interface;
use GitHub or another git-based system for development.
Menu interface
When run without arguments, the application must work off a menu that lets the user select an options for what to do. The program should not end unless and until the user has requested to quit. How you structure the menus is up to you, but here's an example of what you might do. (In this mock-up, the program displays all uncompleted items every time the main menu is shown. You don't have to do this, but since seeing the list is probably the main thing the user cares about, you may want to consider it.)

Welcome to to-do list manager! Here are your current items.
1) Do the laundry
2) Finish the Computer Systems project
3) Call Mom

What would you like to do?
1-3) See more information on this item
A) Mark an item as completed
B) Add a new item
C) See completed items

Q) Quit

Enter choice: 
If the user types the number of an item, it would display the full information (title and additional text) for the item. For example, if the user typed 2:

Finish the Computer Systems project
-----
Due 11/8 - turn in on Canvas
...and it would then return to the main menu. If the user asked to mark an item as completed, it would display a list of items (like above) and ask which one to check off. If the user asks to add a new item, it would prompt for the title and then for additional text. The user could also ask to see completed items, and then the program would display everything that's been checked off.

Command line interface
The user should also be able to perform operations by giving command-line arguments; this should allow them to do anything they can do through the menus. Here are the commands your program should accept:

help: display a help message listing what commands can be used
list: list the uncompleted items with numbers (similar to what is shown above in the main menu example)
complete number: mark the item with the given number as complete
list completed: list the completed items
add title: adds a new item with the given title; whatever is sent to standard input would be the additional text. For example, if your program is called todo, then the command
echo "Due 11/8 - turn in on Canvas" | ./todo add "Finish the Computer Systems project"
would create the item shown in the example above.
Suggested structure
You can do this any way you like, but this is one way to approach it.

Keep uncompleted to-do items in a subdirectory (todo?) and completed ones in another (todo.completed?). Listing the completed/uncompleted items just means showing the files in the appropriate directory. When an item is completed, that means moving it from one directory to another. The program would check whether these directories exist when it's started and create them if not.
Each to-do item (completed or uncompleted) is in a file named simply "1", "2", etc. The first line of the file is the title and the remainder is the additional text.
When a new to-do item is added, you would loop over the existing items and pick the first number that isn't already claimed. (If there are already items 1, 2, and 3, then the new one would be 4.)
When a to-do item is marked completed, then items after it would be shifted down by one. (If there are items 1, 2, 3, and 4 and #2 is completed, then 3 becomes 2 and 4 becomes 3.) This prevents gaps in the listing, which are not allowed (see below).
Specific requirements
All features of the program must operate correctly when the title and/or additional text of an item contain spaces.
Whenever items are numbered, the numbers must be in sorted order and consecutive (no gaps — if there are items 1 and 2 there should also be 3).
Since to-do lists are personal, all data files and directories used by the program must not be readable or writable to users other than the owner. (I.e., whenever the program creates a file or directory, make sure to chmod it appropriately!)
If the program is in menu-driven mode and the user types an invalid menu option, the program should print an error and display the menu again.
If the program is in command-line mode and there is an invalid argument, the program should print an error message and display the help message.
The program should be structured into functions.
You must use a git repository of some sort that is accessible to the instructor and grader, for example a public GitHub repository or a repository that you set up on the CMPT 251 server.
The program will be tested and graded on the CMPT 251 server, and it is highly recommended that you do your development there.
