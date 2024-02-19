# bh.AI - Your Emotional Companion

## Table of Contents
- [Inspiration](#inspiration) 
- [Introduction](#introduction)
- [Screenshots](#screenshots)
- [How It Works](#how-it-works)
- [Tech Stack](#tech-stack)
- [Team bh.AI](#team-bhai)


## Inspiration

The project bh.AI is based upon a recent study that made headlines:

*"20 percent of single American men confessed they had zero close friends. More than half of all men report feeling unsatisfied with the size of their friend groups."*

## Introduction

bh.AI is an emotional companion app designed to address the issue of loneliness and lack of emotional support. It aims to provide users with a platform to express their feelings and emotions freely. Users can log in to the app and engage in conversations with bh.AI about their emotional state.

## Screenshots

<table>
  <tr>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/3a9a5d41-27ae-4593-b0ad-8713f315724d" alt="Screenshot 1"></td>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/65b3a3c7-24b1-4f39-9ed2-3623f30862e7" alt="Screenshot 2"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/0d836270-ae4c-42d9-b160-3f058207f1fa" alt="Screenshot 3"></td>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/3bf52e80-aa58-4fcf-a207-13dd53557266" alt="Screenshot 7"></td>
  </tr>
  
  <tr>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/febed931-1951-4446-80eb-19518a5124bf" alt="Screenshot 8"></td>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/3fb708d0-e05a-4871-8569-af3b5d48ddf9" alt="Screenshot 9"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/02a6d7ab-1c49-4023-baad-43671d4c5361" alt="Screenshot 10"></td>
    <td><img src="https://github.com/Akatsuki49/bh.AI/assets/110471762/3b3d3515-06ed-4c5a-85b7-521566a35faa" alt="Screenshot 11"></td>
  </tr>
</table>


## How It Works!


bh.AI is built using Flutter for the frontend, Flask for the backend, Mistral AI for querying, and Firebase for authentication. Here's how it works:

1. **User Authentication:**
   - Users can sign up or log in using their email and password via Firebase authentication.

2. **Chat Functionality:**
   - Upon logging in, users are presented with a chat screen where they can communicate with bh.AI about how they are feeling.
   - Users can send text messages to bh.AI, expressing their emotions and feelings.

3. **Emotion Analysis using Deepface:**
   - When a user sends a message, a photo is captured of their face using the device's camera.
   - The photo is then sent as a byte stream to the backend Flask server, where a deep learning model (deepface) performs emotion analysis on the face.
   - The emotion analysis results, combined with the user's chat input, are used to formulate a query to Mistral AI, a personalized prompt engineering platform, to generate a comforting response.

4. **Storage and Personalization:**
   - The app stores the user's chat history to provide personalized responses in the future.

## Tech Stack

- **Frontend:** Flutter - An open source cross platform UI framework, using which the beautiful screens of bh.AI were built
- **Backend:** Flask - Backend for the app, uses python , does the image processing as well as queries the LLM using the prompt we engineered  
- **AI Querying:** Mistral AI - An open source and a secure LLM used in the project. 
- **Authentication:** Firebase - Backend as a Service software used to manager user authentication.

## Team bh.AI

<img width="954" alt="Screenshot 2024-02-19 at 3 18 57 PM" src="https://github.com/Akatsuki49/bh.AI/assets/110471762/63aa7f03-e750-40c5-89dd-5571e0431c1f">

