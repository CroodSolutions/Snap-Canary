# Sample Canary Files

In this folder, our community will assemble multiple convincing canary files that you can deploy in your envioronment.  In each canary file, there will be the string "<Paste Canary Token Here>" and you will add your token or value you are tuning your IDS, NDR, or Custom IOA to detect.  

I suggest changing each of these files before deploying in your environment in subtle ways, to make the use of deception less obvious.  

There are a few approaches to creating the canaries.  One is to make them yourself, by creating an index of random values that look like GUIDs or other things that look normal in a file, and then creating a custom detection in your NDR (Suricata Rule) or Custom IOA in your EDR to detect file access, or file movement.  The second (easier) approach is to use a third party for creating the canaries, such as: https://canarytokens.org/nest/ 

Our intention for this repo is to brainstorm and assemble a range of ideas that do not break the bank, to implement deception.  
 
