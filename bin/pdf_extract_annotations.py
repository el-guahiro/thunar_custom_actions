#Autor atul516 https://github.com/atul516/pdf_extract_annotations
import popplerqt5
import argparse


def extract(fn):
    doc = popplerqt5.Poppler.Document.load(fn)
    annotations = []
    for i in range(doc.numPages()):
        page = doc.page(i)
        for annot in page.annotations():
            contents = annot.contents()
            if contents:
                annotations.append(contents)
                ann = " ".join(contents.split())
                print(f'{ann}')

    print(f'{len(annotations)} annotation(s) found')
    return annotations


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('fn')
    args = parser.parse_args()
    extract(args.fn)

