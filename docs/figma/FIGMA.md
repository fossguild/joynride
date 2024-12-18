# UI/UX Documentation

## Figma Link
[Access the Figma Project Here](https://www.figma.com/design/xuM2J5JGZrJHiqXvFWowJ5/Joynride-Figma?node-id=0-1&t=PWLsqxXulxxdUOLR-1)

---

## Overview
This document describes the UI/UX design decisions made for the project, including logo design, overall design style, color scheme, and detailed descriptions of the created screens. 

---

## Logo Design
- **Concept**: Describe the concept and thought process behind the logo (e.g., minimalist, symbolic, etc.).
- **Style**: Mention the design style used for the logo (e.g., flat, gradient, modern, etc.).
- **Significance**: Explain the significance of the logo elements (e.g., shapes, colors, typography).
- **Colors**: In order to refer to USP's sense of community, which is at the roots of the project's security and motivated its development, the colors chosen for the application logo were USP's colors.

![Logo](logo.png)

---

## Design Style
- **Overall Theme**: We followed Google's Material Design 3 language, trying to create a modern and clean looking interface.
- **Typography**: We used Roboto as our main font because it matches quite well with Material Design 3.
- **Icons**: We also kept in line with our chosen design language and went for the icons provided by Google.

![Material Design 3](material_design_logo.jpg)

---
## Typography  

The following font styles were used in the prototype:  

- **Titles**: Roboto Bold  
- **Body Text**: Roboto Regular  

---

## Color Scheme

For the color palette selection, the colors used in the University of São Paulo's system were taken as a reference, namely Blue (Hex: 087F96), which was used as the predominant color of the application, and yellow (Hex: E28B00), used for highlights.  

After defining the two main colors, the website [https://uicolors.app/create](https://uicolors.app/create) was used to generate a complementary color palette based on the chosen colors.

**Primary Colors**
The primary color category includes blue tones divided into different levels for usage. Each level corresponds to a shade of blue, numbered for clarity (e.g., Primary/100 to Primary/1100).

Primary/100: #ebfffe

Primary/200: #cdffff

Primary/300: #a1fbff

Primary/400: #60f6ff

Primary/500: #18e6f8

Primary/600: #00c9de

Primary/700: #0094ac

Primary/800: #087f96

Primary/900: #10667a

Primary/1000: #125567

Primary/1100: #053847

The Primary color scheme, ranging from light to dark blue, is suitable for key UI components like buttons, links, and primary highlights.

**Secondary Colors**

The secondary colors are yellow-orange tones, similarly divided into 11 levels, providing flexibility for different emphasis needs.

Secondary/100: #fffeea

Secondary/200: #fff9c5

Secondary/300: #fff385

Secondary/400: #ffe746

Secondary/500: #ffd61b

Secondary/600: #feb500

Secondary/700: #e28b00

Secondary/800: #bb6202

Secondary/900: #984b08

Secondary/1000: #7c3e0b

Secondary/1100: #481f00

These shades can be used for warnings, highlights, and complementary accents in the user interface.


 **Contrast and Accessibility**

To ensure accessibility and compliance with **WCAG (Web Content Accessibility Guidelines)** standards:  

#### Contrast  
- Darker tones such as **Primary/900** and **Secondary/900** provide excellent contrast against light backgrounds.  
- Lighter shades like **Primary/100** may require careful placement to avoid low contrast against white or gray backgrounds.  

#### Accessibility  
- Text and interactive elements should maintain a contrast ratio of at least **4.5:1** for small text and **3:1** for large text.  
- For example, **Primary/800** on a white background meets the required ratio.  

#### State Feedback  
**Success (Green)**, **Warning (Orange)**, and **Error (Red)** colors are intuitive for users to quickly understand system statuses. These categories also benefit from multiple shades:  
- **Success**: `Success/100 - Success/1100`  
- **Warning**: `Warning/100 - Warning/1100`  
- **Error**: `Error/100 - Error/1100`  

![Color Palette](colors.png)

---

## Screens Overview
This section provides an overview of each screen, its purpose, and the key design decisions.

### Flash Screen
- **Purpose**: Opens with the application and stays on screen while everything loads.
- **Design Decisions**: We decided to keep it as simple as possible with only our logo in the middle with a clean background with our primary color

![Flash Screen](flash_screen.png)

### Login
- **Purpose**: Allow the user to access it's own account with JupiterWeb unified login system
- **Design Decisions**: We kept it simple with a logo, a title and a button that will redirect the user to the unified login page.

![Login Screen](login.png)

### Navigation bar
- **Purpose**: Provide easy access to different sections of the app.
- **Design Decisions**: We gave the user access to the five main sections of the app: search, offer, rides, messages and profile.

![Navigation bar on screen](barra_navegacao.png)

### Search
- **Purpose**: Allow the user to search for rides.
- **Design Decisions**: We were heavily inspired by Blablacar design, trying to keep it as simple as possible. The user can search for rides by typing the origin, destination, date of the ride and the number of passengers.

![Search screen](procurar.png)

### Available rides
- **Purpose**: After searching, display available trips for users.
- **Design Decisions**: At the top we show the user's search parameters with a button that can display a dialog for filters and below we show the available rides. All the rides have a status symbol that shows how far the ride is from the user's desired location (green for near, orange for walkable and red for far).

![Available rides screen](viagens_disponiveis.png)

### Unreserved selected ride
- **Purpose**: Showcase details of a trip before reservation.
- **Design Decisions**: We give the user all the relevant information about the ride: date, time and location of departure and arrival with our distance status, the driver's name, ratings and option to message, the car's model and color, the number of passengers and a button to reserve the ride.

![Unreserved selected ride screen](viagem_selecionada_sem_reserva.png)

### Alert Dialogue
- **Purpose**: Warn users about critical actions.
- **Design Decisions**: We kept this as simple as possible with a title, a green button to confirm and a red button to cancel.

![Alert Dialogue screen](dialog_alerta.png)

### Offer ride
- **Purpose**: Allow users to offer a ride.
- **Design Decisions**: Also heavily inspired by Blablacar. The user types the origin, destination, date and time of the ride, number of passengers and if it's a fast reservation or not.

![Offer ride screen](oferecer.png)

### Offered ride
- **Purpose**: About the same purpose as the "Unreserved selected ride" screen, but for the driver.
- **Design Decisions**: We kept the same layout as the "Unreserved selected ride" screen, but with a few differences: we don't show the distance status, we can accept or refuse a rider and the option to cancel the ride.

![Offered ride screen](viagem_oferecida.png)

### My rides
- **Purpose**: Display trips that the user is associated with (offered or reserved).
- **Design Decisions**: We separated the rides in two tabs: offered and reserved. The user can see the details such as arrival and departure locations, date and time, driver's name and map of the route in the card. Clicking on the card will show more details about the ride.

![My rides screen](minhas_viagens.png)

### Reserved rides
- **Purpose**: About the same purpose as the "Offered ride" screen, but for the rider.
- **Design Decisions**: Same layout as the "Offered ride" screen, but with a few differences: we don't show the option to accept or refuse a rider and the rider can cancel the ride.

![Reserved rides screen](viagem_reservada.png)

### Messages
- **Purpose**: Display a list of conversations.
- **Design Decisions**: Shows the user's conversations with other users. The user can see the other user's name, the last message sent, the time it was sent and the number of unread messages. We also gave the user a search bar to search for a specific conversation and a filter button. New conversations cannot be started from this screen.

![Messages screen](mensagens.png)

### Dialogues
- **Purpose**: Enable direct communication between users.
- **Design Decisions**: A really simple chat layout like many other apps have. Lets you send and recieve text messages only.

![Dialogues screen](conversa.png)

### My profile
- **Purpose**: Present the user's profile details.
- **Design Decisions**: Has some basic informations like the user rating, University (as it is a student focused app) and a little text that the user writes about himself.

![My profile screen](perfil.png)

### Other user's profile
- **Purpose**: Display another user's profile information.
- **Design Decisions**: Exactly the same as "My profile" but with a button to send a message to this other user.

![Other user's profile screen](perfil_outros.png)


---

## Key Design Decisions
- **Consistency**: We tried to keep it simple and functional, getting inspiration from some already set industry trends and giving it a fresher look.
- **User Feedback**: We worked as a team with to get to this design, getting feedback from all other developers 0(frontend, backend developers and others) and settling on one that made everyone happy.

---

## Interactive Prototype 

Finally, to better visualize the fluidity of the application and in order to integrate the project flow diagrams with the prototyped screens and preserve the idea conceived by the team, an interactive prototype was created using figma's "prototype" tool. This workflow can be accessed at the link below:

[Access the Interactive Prototype Here](https://www.figma.com/proto/xuM2J5JGZrJHiqXvFWowJ5/Joynride-Figma?node-id=0-1&p=f&t=JbB9PALVZEjoumII-0&scaling=scale-down&content-scaling=fixed&starting-point-node-id=3%3A752).

---

## Prototype Development  

This prototype created in **Figma** was developed by the following students:  

- **Beatriz Lomes da Silva** ([b.lomes@usp.br](mailto:b.lomes@usp.br))  
- **Gustavo Moura Scarenci de Carvalho Ferreira** [gustavomourascarenci@usp.br](mailto:gustavomourascarenci@usp.br)  
- **Matheus Henrique Dias Cirillo** ([matheuscirillo@usp.br](mailto:matheuscirillo@usp.br))   
- **Maria Júlia Soares De Grandi** ([maju.degrandi@usp.br](mailto:maju.degrandi@usp.br))  
