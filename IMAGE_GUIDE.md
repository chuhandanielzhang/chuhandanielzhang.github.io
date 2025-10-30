# Image Management Guide

## Current Images in Your Project

### Profile Photo
- **File**: `profile-photo.jpg` (2.2 MB)
- **Usage**: Sidebar profile picture on all pages
- **Update**: Replace this file to change your profile photo

### Robotics Competition Photos

#### Team 9698B (2015-2016 Season)
1. **robotics-9698b-main.jpg** (150 KB) - Main robot photo with orange collection system
2. **robotics-9698b-working.jpg** (98 KB) - Team working on robot at competition
3. **robotics-9698b-team.jpg** (91 KB) - Drive team members
4. **robotics-9698b-award.jpg** (102 KB) - Division champions award ceremony

#### Team 9666A (2019-2022 Season)
1. **robotics-9666a-main.jpg** (3.7 MB) - Tower Takeover robot
2. **robotics-9666a-worlds.jpg** (85 KB) - VEX Worlds celebration

## How to Manage Images

### To Add New Images:

1. **Save the image** in the project root directory (same folder as `index.html`)
2. **Rename it** with a clear, descriptive name
   - Use lowercase letters
   - Use hyphens to separate words
   - Include the context (e.g., `robotics-[team]-[description].jpg`)
3. **Update the HTML** file that uses the image
   - Open `robotics.html` (or other HTML files)
   - Find the `<img src="...">` tag
   - Change `src` to your new filename
4. **Commit and push**:
   ```bash
   git add your-new-image.jpg
   git add robotics.html  # or other HTML file you changed
   git commit -m "Add new robotics image"
   git push
   ```

### To Replace Existing Images:

1. **Keep the same filename** (important!)
2. **Replace the file** with your new image
3. **Commit and push**:
   ```bash
   git add robotics-9698b-main.jpg  # example
   git commit -m "Update robotics main photo"
   git push
   ```

### To Delete Images:

1. **Remove the file** from your project
2. **Update the HTML** to remove the `<img>` tag
3. **Commit and push**:
   ```bash
   git rm old-image.jpg
   git add robotics.html
   git commit -m "Remove old image"
   git push
   ```

## Best Practices

- ✅ Keep image filenames descriptive and consistent
- ✅ Use lowercase and hyphens for filenames
- ✅ Compress large images before uploading (aim for < 500 KB each)
- ✅ Keep original high-res versions backed up elsewhere
- ❌ Don't use spaces in filenames
- ❌ Don't use special characters (only letters, numbers, hyphens, underscores)

## Folder Structure

All images are currently in the project root (same folder as HTML files). If you want to organize them into folders later:

```
your-project/
├── index.html
├── profile-photo.jpg
├── images/              # Create this folder
│   ├── robotics/
│   │   ├── robotics-9698b-main.jpg
│   │   ├── robotics-9698b-working.jpg
│   │   └── ...
│   └── awards/
│       └── ...
├── styles/
└── scripts/
```

Then update your HTML: `<img src="images/robotics/robotics-9698b-main.jpg">`

## Current Directory

You can view all images in your project with:
```bash
ls -lh *.jpg
```

