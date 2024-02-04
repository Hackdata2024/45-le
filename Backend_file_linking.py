import flet
from flet import Page, Text, FilePicker, ElevatedButton, Row, Image, Container, FilePickerResultEvent
import shutil
import os

def main(page: Page):
    # Set a visually appealing background color and ensure the page uses the full width
    page.bgcolor = "#f5f5f5"
    page.padding = 10

    # Ensure the image path is correct relative to the current working directory
    # Make sure 'LegalEase_logo.png' is located in the 'myupload' directory within athe project folder
    logo_path = os.path.join("myupload", "LegalEase_logo.jpg")
    if os.path.exists(logo_path):
        # If the path is correct and file exists, create an Image widget
        logo = Image(src=logo_path, width=50, height=50)
    else:
        # If the file doesn't exist, use a placeholder Text widget to indicate the missing logo
        logo = Text("Logo Not Found", color="red")

    brand_name = Text("LegalEase", size=25, weight="bold")

    # Place brand name and logo in a Row for horizontal alignment
    header = Row([logo, brand_name], alignment="center", vertical_alignment="center", expand=True)

    # Initialize Text widget to display file save confirmation
    save_confirmation = Text("", size=20, expand=True)

    def saveupload(e: FilePickerResultEvent):
        for x in e.files:
            you_copy = os.path.join("myupload", x.name)
            if not os.path.exists("myupload"):
                os.makedirs("myupload")
            shutil.copy(x.path, you_copy)
            save_confirmation.value = f"Your file {x.name} is saved in myupload"
            page.update()

    file_picker = FilePicker(on_result=saveupload)

    def upload_file(e):
        file_picker.pick_files()

    upload_button = ElevatedButton("Upload file", on_click=upload_file, expand=True)
    btn = Row([upload_button], alignment="center", vertical_alignment="center", expand=True)


    # Add elements to the page
    page.add(header)
    page.add(btn)
    page.add(save_confirmation)

    page.overlay.append(file_picker)

    # Explicitly update the page to ensure changes are rendered
    page.update()

flet.app(target=main, upload_dir="myupload")
