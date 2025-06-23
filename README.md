# A script to convert Markdown files to ePub
This simple script is designed to support the use of the Obsidian Web Clipper as part of a read-later solution for e-readers. It assumes the user is saving articles on a Mac with Hazel and Calibre installed. The workflow is as follows:
- Use the Obsidian Web Clipper to download to an Obsidian vault created for this purpose.
- Use the Obsidian plugin Local Images Plus to automatically download the images locally, allowing them to be incorporated into the ePub. 
- Have Hazel watch the folder that is the target of Obsidian Web Clipper. Setup Hazel to run this script when a .md file is added
- Setup the script to output to a convenient location. I have it send the file to my Dropbox folder which my e-reader can access.
- The script will then delete the files created by Local Images Plus. If defined, it will save the markdown file for an archive - or don’t define this folder and it will delete that too.

Note that Obsidian Local Images Plus needs the following options to be set:
- How to write paths in tags: relative to note
- Folder to save new attachments: next to note in the folder specified below

You can run Obsidian Web Clipper on an iPhone or iPad, but I found the saving to be much more reliable on a Mac. The iPhone app Hyperduck creates a “send to Mac” option in the share sheet which I find really a helpful and reliable method.