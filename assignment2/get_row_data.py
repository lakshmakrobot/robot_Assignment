import openpyxl
import sys

def read_excel_row(file_path, sheet_name, row_number):
    workbook = openpyxl.load_workbook(file_path)
    sheet = workbook[sheet_name]
    row_values = [cell.value for cell in sheet[row_number] if cell.value is not None]
    workbook.close()
    print(f"Row Data: {row_values}")
    return row_values


if __name__ == "__main__":
    if len(sys.argv) != 4:
        sys.exit(1)

    file_path = "/home/lakshmank/robottest/challenge.xlsx"
    sheet_name = "Sheet1"
    row_number = 2
    read_excel_row(file_path, sheet_name, row_number)
    
