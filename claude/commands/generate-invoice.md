# Generate Invoice

Generate a PDF invoice and save it to `~/Downloads/`.

## When to use

When the user asks to create, generate, or make an invoice. The user will typically provide details
via a voice note or brain dump; parse what they say and fill in the fields below.

## Sender details

There are two known senders. Determine which one from context:

- **Charlie**: Charlie Revett, invoices@revdex.fastmail.com
- **Katie**: Katie Smith, katiersmithll88@gmail.com

## Required fields

- **From**: One of the senders above
- **To name**: Client name (person or company)
- **To email**: Client email address
- **Date**: Invoice date (YYYY-MM-DD), default to today if not specified
- **Due date**: Payment due date (YYYY-MM-DD), default to 30 days from invoice date if not specified
- **Line items**: Each with a description, quantity, and rate (GBP)
- **Bank details**: Sort code, account number, and account name for payment. These are sensitive and
  must NOT be stored in any file — the user must provide them each time as part of their request.

If the user hasn't provided enough information (e.g. missing client email or bank details), ask
before generating. Do not proceed without bank details.

## How to generate

Write a temporary Python script to `/tmp/generate-invoice.py` using `fpdf2` and run it. Before
running, ensure `fpdf2` is installed:

```bash
pip install --quiet fpdf2 2>/dev/null || pip install --quiet --break-system-packages fpdf2
```

The script must produce a PDF with this exact layout:

1. **Title**: "INVOICE" in Helvetica Bold 24pt.
2. **From / To**: Side by side. Bold labels, then name and email on separate lines.
3. **Dates**: "Date:" and "Due Date:" as bold labels with values beside them.
4. **Line items table**: Columns — Description (left-aligned), Qty (right), Rate (right, £), Amount
   (right, £). Header row with light grey background (#F0F0F0). Helvetica 10pt.
5. **Divider line** below the last row.
6. **Total**: Bold 12pt, right-aligned, with £ symbol.
7. **Bank details**: Below the total. Bold label "Bank Details", then account name, sort code, and
   account number on separate lines. Helvetica 10pt.

Use `fpdf2` with `FPDF`. Use `Helvetica` font only. Currency is GBP (£). Page size A4.

## Output

Save the PDF to `~/Downloads/` with this filename format:

```text
YYYY-MM-DD_Sender-Name_Client-Name.pdf
```

Rules for the filename:

- Date is the invoice date
- Names are title-cased with spaces replaced by hyphens
- Remove any characters that aren't alphanumeric or hyphens
- Example: `2026-03-20_Katie-Smith_Acme-Corp.pdf`

Print the full output path when done and confirm to the user.
