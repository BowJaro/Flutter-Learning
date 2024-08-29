final List<Map<String, dynamic>> contacts = [
  {
    "id": 1,
    "name": "Harry Truman",
    "message": "Hi, Good to see you.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/225px-Joe_Biden_presidential_portrait.jpg",
    "time": "2024-07-10 14:32:45"
  },
  {
    "id": 2,
    "name": "Eleanor Roosevelt",
    "message": "Looking forward to our meeting tomorrow.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Donald_Trump_official_portrait.jpg/225px-Donald_Trump_official_portrait.jpg",
    "time": "2024-07-20 09:15:22"
  },
  {
    "id": 3,
    "name": "Winston Churchill",
    "message": "We shall never surrender.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/President_Barack_Obama_%28cropped%29_4.jpg/225px-President_Barack_Obama_%28cropped%29_4.jpg",
    "time": "2024-08-01 11:22:33"
  },
  {
    "id": 4,
    "name": "Franklin D. Roosevelt",
    "message": "The only thing we have to fear is fear itself.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/George-W-Bush.jpeg/225px-George-W-Bush.jpeg",
    "time": "2024-08-10 19:44:05"
  },
  {
    "id": 5,
    "name": "John F. Kennedy",
    "message":
        "Ask not what your country can do for you—ask what you can do for your country.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Bill_Clinton.jpg/225px-Bill_Clinton.jpg",
    "time": "2024-08-15 13:55:12"
  },
  {
    "id": 6,
    "name": "Abraham Lincoln",
    "message": "Four score and seven years ago...",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/George_H._W._Bush_presidential_portrait_%28cropped%29.jpg/225px-George_H._W._Bush_presidential_portrait_%28cropped%29.jpg",
    "time": "2024-08-25 17:30:50"
  },
  {
    "id": 7,
    "name": "Martin Luther King Jr.",
    "message": "I have a dream that one day this nation will rise up...",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/John_F._Kennedy%2C_White_House_color_photo_portrait.jpg/225px-John_F._Kennedy%2C_White_House_color_photo_portrait.jpg",
    "time": "2024-08-05 10:22:44"
  },
  {
    "id": 8,
    "name": "Nelson Mandela",
    "message": "It always seems impossible until it's done.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Official_Portrait_of_President_Reagan_1981.jpg/225px-Official_Portrait_of_President_Reagan_1981.jpg",
    "time": "2024-08-29 08:15:22"
  },
  {
    "id": 9,
    "name": "Margaret Thatcher",
    "message": "Watch your thoughts, for they will become actions.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/JimmyCarterPortrait2.jpg/225px-JimmyCarterPortrait2.jpg",
    "time": "2024-07-18 21:42:12"
  },
  {
    "id": 10,
    "name": "John Adams",
    "message": "The best way to predict your future is to create it.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Gerald_Ford_presidential_portrait_%28cropped_3%29.jpg/225px-Gerald_Ford_presidential_portrait_%28cropped_3%29.jpg",
    "time": "2024-08-03 06:27:55"
  },
  {
    "id": 11,
    "name": "Theodore Roosevelt",
    "message": "Do what you can, with what you have, where you are.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Richard_Nixon_presidential_portrait_%281%29.jpg/225px-Richard_Nixon_presidential_portrait_%281%29.jpg",
    "time": "2024-08-20 22:13:33"
  },
  {
    "id": 12,
    "name": "Dwight D. Eisenhower",
    "message": "Plans are nothing; planning is everything.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Dwight_D._Eisenhower%2C_official_photo_portrait%2C_May_29%2C_1959_%28cropped%29%283%29.jpg/225px-Dwight_D._Eisenhower%2C_official_photo_portrait%2C_May_29%2C_1959_%28cropped%29%283%29.jpg",
    "time": "2024-08-12 15:48:27"
  },
  {
    "id": 13,
    "name": "Benjamin Franklin",
    "message": "An investment in knowledge pays the best interest.",
    "imageUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/37_Lyndon_Johnson_3x4.jpg/225px-37_Lyndon_Johnson_3x4.jpg",
    "time": "2024-08-29 08:15:22"
  }
];

const messages = [
  {"isMe": false, "text": "Hey What is up with you!!", "time": "10:00 am"},
  {"isMe": true, "text": "im fine,wbu?", "time": "11:00 am"},
  {"isMe": false, "text": "I am great man!", "time": "11:01 am"},
  {
    "isMe": false,
    "text": "Just messaged cuz I had some work.",
    "time": "11:01 am"
  },
  {"isMe": true, "text": "Obviously, say", "time": "11:03 am"},
  {
    "isMe": false,
    "text": "haha I wanted you to check out my new channel ^^",
    "time": "11:04 am"
  },
  {
    "isMe": true,
    "text": " Sure, what is the channel name?",
    "time": "11:05 am"
  },
  {
    "isMe": false,
    "text": "Rivaan Ranawat",
    "time": "11:06 am",
  },
  {
    "isMe": true,
    "text": "Looks great to me!",
    "time": "11:15 am",
  },
  {"isMe": false, "text": "Thanks bro!", "time": "11:17 am"},
  {"isMe": false, "text": "Did you subscribe?", "time": "11:16 am"},
  {"isMe": true, "text": "Yes, surely bro!", "time": "11:17 am"},
  {
    "isMe": false,
    "text": "Cool, did you like the content?",
    "time": "11:18 am",
  },
  {
    "isMe": true,
    "text": "I loved it?",
    "time": "11:19 am",
  },
  {
    "isMe": false,
    "text": "OMG! Woah! Thanks!",
    "time": "11:20 am",
  },
];
