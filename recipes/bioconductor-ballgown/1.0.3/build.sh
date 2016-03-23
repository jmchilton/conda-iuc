#!/bin/sh

# For whatever reason, it can't link to gsl correctly without this on OS X.
export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib:$(HOME)/lib:/usr/local/lib:/lib:/usr/lib

download(){
    PACKAGE=$1
    VERSION=$2
    SHA256=$3

    PV=${PACKAGE}_${VERSION}.tar.gz

    wget --no-check-certificate https://depot.galaxyproject.org/package/noarch/${PV}
    sha256sum ${PV} | awk '{ if ($1 == "'${SHA256}'") exit 0; else exit 1}'
    tar xfz ${PV}
    cd ${PACKAGE}
    mv DESCRIPTION DESCRIPTION.old
    grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
    $R CMD INSTALL --build .
    cd .. && rm -rf ${PACKAGE}
}

download   BiocGenerics        0.12.1     d451f2c72c46a7b5fa6dd252a207ba72f0a5a86d1bfc95408935f079efa85f77
download   S4Vectors           0.4.0      8a696633faf34458580ca851a77eb55cfa60e454a5412216c8dd3c19fac46b78
download   IRanges             2.0.1      6c26fcb89570f869fe476688d59e99f4c4eb8358a4f8a16d00f77ab04a9c3db9
download   GenomeInfoDb        1.2.4      459d8904e30999435f7dd2ce40fc9a1b076982f798a6d2fb752d0311a7bcbd4b
download   XVector             0.6.0      ea61b364a647b590a566c69429e9eb9d10296825bac2d8168881dd8404d8ba14
download   GenomicRanges       1.18.4     1ff768364df263f7c55b31488b8718f173ae06f4d3bc6f49d4f24ccf300f4aa9
download   RColorBrewer        1.1-2      f3e9781e84e114b7a88eb099825936cc5ae7276bbba5af94d35adb1b3ea2ccdd
download   lattice             0.20-30    528ce0a6378334de47e11a1a7efe0f4b3b1c8b44ec8e3f0720bd9e5b122d2881
download   nlme                3.1-120    4cd65b2187d6155652d8725f62086641da373f23f3bce4170ace92705cb628ca
download   Matrix              1.1-5      b23ea59a5218be916a3e6ac4d5f573c5e7921b1eca9a2ed918f2d8f8ef520b4f
download   mgcv                1.8-5      dcad548be9efbff8737e54082dde5a20cac79f81037eb79586ad68bf403f7c8c
download   Biobase             2.26.0     c481a23e57762d969b225d0fa2e72cbe72e0ce037422d89bafcc8b7527561b9c
download   DBI                 0.3.1      1c26535720f146fae8cc9ef6e190619967abf296706a5b5a1e8242cbbb5a4576
download   RSQLite             1.0.0      8e0cfca19afbc61f40c6d86018cd723a7e00f16d0944c4637f07a18fb6d76121
download   AnnotationDbi       1.28.1     214a293286af854001ce46b9d866ea5b3fbc4e6b8383be0952f63491e4f6171c
download   XML                 3.98-1.1   947318e0e0d272bcd57244999d897d6f7b2624554fdf451f8c3c0461c8313159
download   xtable              1.7-4      47629a31185591be30b13ae3a656fc24360760996975e292f4fa7954c0257dbb
download   annotate            1.44.0     c191767f5876f8e44a82779749237e91f1e99b3dc6b8e93fe7a8c3e43d91b3ca
download   survival            2.38-1     f5b90925b7f4fd23ba99fb44b713ffe3b6768bfe7cb81037b9f0d615a051004f
download   genefilter          1.48.1     31356f8eabecd6b4fe6124edcf9cd6b258481ff124061d709f49cb10f29691f6
download   sva                 3.12.0     53afc52973093a8a853cfa5e1ea4c03ca51bb744f8917b520efb8f429d8054f4
download   limma               3.22.6     011131ed104f5be2eed7d7387877e2fe70c1ac72c1052de12cd2284cb61ce2b3
download   zlibbioc            1.12.0     3a6738f0e2f341c4d511d3e230823c8494e1d65ab528aaa73d4507c7e338fa16
download   Biostrings          2.34.1     b00af8f8eb1dbafa4e0ab25b571fa0a9484376c761b4de949eb6bbb7d41bd0cd
download   bitops              1.0-6      9b731397b7166dd54941fb0d2eac6df60c7a483b2e790f7eb15b4d7b79c9d69c
download   RCurl               1.95-4.5   365c582a6da2ef22f8d1bcbbeafe8478ed31de17b0890f740a3e2960620f1382
download   Rsamtools           1.18.2     c845acbc05ff87a12aec1162fe687dda1a043d3e2efa5c08902c006b1ef5f4a6
download   codetools           0.2-10     329125c0f60092bad43569823fc9cda2a010e3abe82c27030afae23a4970383e
download   iterators           1.0.7      1bf74e5a5603b2b2d3deecb801ca1796e2b2c3f08c488c497725c5cb205798ff
download   foreach             1.4.2      d4fd8f090029d9b9168ae415e6ab13ef017f06f1879488a2e0af4bcfd999ff24
download   checkmate           1.5.1      0f837be7b92ccc7e2ed6930f342cfaab0213d2df2b82052a4788c8a399bd9c04
download   BBmisc              1.9        4b7fd5c6c1358a7e4c32c10237aa6f3f5279585afef83b0ffa1b3fc74c5f3006
download   brew                1.0-6      d70d1a9a01cf4a923b4f11e4374ffd887ad3ff964f35c6f9dc0f29c8d657f0ed
download   digest              0.6.8      3062422c2ca917e52749464d63084a0d3cc061f59083f069280ec26336ce2f55
download   fail                1.2        9fa037f5bff4ad3821ef1af4fe2986f2900cfa9a69d11f7a800a081cc359fb77
download   base64enc           0.1-2      05fed8fde229fce48f5b9cd34f3bf92f2ca63d6038ba7cb9d37a2904e83e4b34
download   sendmailR           1.2-1      04feb08c6c763d9c58b2db24b1222febe01e28974eac4fe87670be6fb9bff17c
download   stringr             0.6.2      c3fc9c71d060ad592d2cfc51c36ab2f8e5f8cf9a25dfe42c637447dd416b6737
download   BatchJobs           1.5        97583c7ddeb43a5361a9b45eab8b47a166077521c6963507e0155820690e44a9
download   BiocParallel        1.0.3      339c7c8285637afafa0f3ca3d429ef002df5da1653490984cd64662f7cabf71f
download   GenomicAlignments   1.2.1      eea049da0427d04a65c0a8b41a41ad1fc679a174e94b0879d5035d676e6ae3f0
download   rtracklayer         1.26.2     c0284805d84f83f6189dc5a58461ea9ace8ec43dc301b0b317f4c3b493bf8bdb
download   ballgown            1.0.3      f79f0db8d9aa7a3c56feb1034dfd4f8fccb4aa4f962c88aebdd1cac728b19698
