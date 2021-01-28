# Game Jam 2021 Document

## Basic Concept
The player must find all the lost cats hiding in the trees within the time limit. The player finds cats by approaching trees and shaking them. Each cat is worth one point. However, dogs may also fall from the trees. If the player collects a dog, they lose three points. The game ends after the time limit.

## Logic Components
Player  
> Movement  
>> Gravity  
>>> Input  
>>>> Move left/right  
>>>> Jump  
  
Collectables  
    Cats  
        Increase points by one  
    Dogs  
        Decrese points by three  
        
Environment  
    Level Design  
        Collisions  
  
Interactables  
    Trees  
        On interact:  
            Spawn either cat or dogs  
Game  
    Timer  
        Upon timer end:  
            Display score  
    Score  
    
## Aesthetics
Pixel art, minimal, possibly black/white
