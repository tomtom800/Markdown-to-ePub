# A script to convert Markdown files to ePub
This simple script is designed to allow the Obsidian Web Clipper to be used as a read-later solution for e-readers. The user saves pages with the Clipper and they automatically convert to an ePub for syncing to an e-reader.
It assumes the user is saving articles on a Mac with Obsidian, the Obsidian Web Clipper, the Obsidian Local Images Plus plugin, Hazel and Calibre all installed. The workflow is as follows:
- Use the Obsidian Web Clipper to download to an Obsidian vault created for this purpose.
- The Obsidian plugin Local Images Plus will automatically download the images locally, allowing them to be incorporated into the ePub. 
- Hazel is setup to watch the folder that is the target of Obsidian Web Clipper and run this script when a .md file is added
- The output is set to a convenient location. I have it send the file to my Dropbox folder which my e-reader can access, so the whole process is automatic.
- The script will then delete the files created by Local Images Plus. If defined, it will save the markdown file for an archive - or don’t define this folder and it will delete that too.

Note that Obsidian Local Images Plus needs the following options to be set:
- How to write paths in tags: relative to note
- Folder to save new attachments: next to note in the folder specified below

You can run Obsidian Web Clipper on an iPhone or iPad, but I found the saving to be much more reliable on a Mac. The excellent iPhone app [Hyperduck](https://sindresorhus.com/hyperduck) creates a “send to Mac” option in the share sheet which I find a helpful and reliable method.