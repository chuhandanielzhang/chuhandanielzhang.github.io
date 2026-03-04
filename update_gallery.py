import os
import random

def generate_gallery_html(folder, title):
    files = [f for f in os.listdir(folder) if f.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.webp'))]
    random.shuffle(files)
    
    html = f'''            <section class="gallery-section">
                <div class="gallery-header">
                    <h2 class="gallery-title">{title}</h2>
                    <span class="gallery-note">{len(files)} photos · wheel to browse</span>
                </div>
                <div class="wheel-gallery" aria-label="{title} gallery">
                    <div class="gallery-track">'''
    
    for f in files:
        html += f'\n                        <div class="photo-tile"><img src="{os.path.basename(folder)}/{f}" alt="{title} image" loading="lazy"></div>'
        
    html += '''
                    </div>
                </div>
            </section>'''
    return html

photo_html = generate_gallery_html('/Users/daniel/Desktop/phd/website_backup/photography', 'Photography')
bike_html = generate_gallery_html('/Users/daniel/Desktop/phd/website_backup/bicycle', 'Bicycle')

with open('/Users/daniel/Desktop/phd/website_backup/interests.html', 'r') as f:
    content = f.read()

# Replace the sections
import re
pattern = r'<section class="gallery-section">.*?</section>\s*<section class="gallery-section">.*?</section>'
new_content = re.sub(pattern, photo_html + '\n\n' + bike_html, content, flags=re.DOTALL)

with open('/Users/daniel/Desktop/phd/website/interests.html', 'w') as f:
    f.write(new_content)

print("HTML updated!")
