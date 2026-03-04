import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Use regex to remove <ul class="sidebar-submenu">...</ul> blocks
    new_content = re.sub(r'\s*<ul class="sidebar-submenu">.*?</ul>', '', content, flags=re.DOTALL)
    
    if new_content != content:
        with open(filepath, 'w') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

print("Done!")
