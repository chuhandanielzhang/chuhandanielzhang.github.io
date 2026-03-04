import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # 1. Fix sidebar spacing (ensure uniform spacing between li elements)
    # Remove any extra empty lines or spaces between li tags in the sidebar
    content = re.sub(r'</li>\s*<li>', '</li>\n                    <li>', content)
    
    # 2. Change "Robotics Competition" to "Competition: Robotics" in the sidebar
    content = content.replace('<span class="icon">🤖</span>Robotics Competition', '<span class="icon">🤖</span>Competition: Robotics')
    
    # 3. Change "Beyond Academics" emoji from 🎨 to 📷
    content = content.replace('<span class="icon">🎨</span>Beyond Academics', '<span class="icon">📸</span>Beyond Academics')
    
    # 4. Replace "GTIIT" with "Technion China" (case sensitive to avoid breaking links)
    # First, protect links that might contain gtiit
    content = content.replace('gtiit.edu.cn', 'GTIIT_EDU_CN_TEMP')
    content = content.replace('GTIIT', 'Technion China')
    content = content.replace('GTIIT_EDU_CN_TEMP', 'gtiit.edu.cn')
    
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
