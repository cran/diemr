# incorrect chunk size

    Code
      vcf2diem(SNP = filename, filename = "test.txt", chunk = 3)
    Message <simpleMessage>
      Expecting to include 8 markers per diem file.
      If you expect more markers in the file, provide suitable chunk size.
      Done with chunk 1
      Done with chunk 2

# resolve multiallelic markers

    Code
      vcf2diem(SNP = brenthis, filename = "brenthis.txt", chunk = 1)
    Message <simpleMessage>
      Expecting to include 29 markers per diem file.
      If you expect more markers in the file, provide a suitable chunk size.

