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

download   BiocGenerics     0.14.0        5e55e0f5c6577935d169f62268dc05a168a2f607b652d44a919cb16caca7952e
download   S4Vectors        0.6.5         25f82ea9278cfc93b8dadb70fe3b6d114719ea4247c28178d699fde8cacd68f0
download   IRanges          2.2.7         0609e1887e17ab75f8fcabb40e7c5995a4033c2c6e764e73bda8d35350561861
download   GenomeInfoDb     1.4.2         3d4ff22c6a11192ee1e313042ff0da4703b18c72f2247be73a0590769328d05a
download   XVector          0.8.0         0da74db92148cd3ac9ce1b77d763599bc924700b0df423be1af1eb8fa778009b
download   GenomicRanges    1.20.6        9d2bedd17a73864406d0284ddea2d28aef84c7c969b6924d8be2285d96f14e13
download   Rcpp             0.12.0        68782050f5252c4246f1b5b335105eccf4c804d57a0cd41eb63a300f7e0241a0
download   RcppArmadillo    0.5.500.2.0   f30155fdd4745b4c9a548a25a30b6ae5fe3e3f6cf4136ac485a75c90555934a0
download   Biobase          2.28.0        056b12f15e4164c3ea22bb3462ae2e5d7f391b91e473c014ee51e5460431ffa6
download   lambda.r         1.1.7         8ae36527124752f7af01eb84a55fa77716226b0e76dd03966b83d9583dcfbfd3
download   futile.options   1.0.0         ee84ece359397fbb63f145d11af678f5c8618570971e78cc64ac60dc0d14e8c2
download   futile.logger    1.4.1         a1e485e943d288b92a2af3337b333be95d1b51246dd14be9f18ae5ce626894de
download   snow             0.3-13        ceb6af66f8c988a7606c4ba2d7ccf84c14bca6c376f8d9133089296607c14bc1
download   BiocParallel     1.2.20        b537ff2f7a46982b5897805c40cba63846acfdf855530c3c0c36d57276fb456a
download   DBI              0.3.1         1c26535720f146fae8cc9ef6e190619967abf296706a5b5a1e8242cbbb5a4576
download   RSQLite          1.0.0         8e0cfca19afbc61f40c6d86018cd723a7e00f16d0944c4637f07a18fb6d76121
download   AnnotationDbi    1.30.1        cefd8d389e71e9b0002cdca78b8d4ae39a950248aaefcf647faaeaa13a2643bb
download   XML              3.98-1.3      5e1fb547848b12b9b1a14a1e647891d62dbbebb2a87da28e10e095a1d0f52a49
download   xtable           1.7-4         47629a31185591be30b13ae3a656fc24360760996975e292f4fa7954c0257dbb
download   annotate         1.46.1        a687835e735c74ce1a19127758626986c6bd495cda5be7b17dfd4318ac5640f7
download   survival         2.38-3        2588ba869471d97a42628611496ba0ce6ade188143f673af41987c7d4a8972c2
download   genefilter       1.50.0        3808a8d5d9853c7915c5ba74e992d96470c4d546d7d6cbea03c4e43e5b68df77
download   lattice          0.20-33       8f46260a14364d945c7b74587cdb54986f36303588dd14010a33d15dba085931
download   locfit           1.5-9.1       f524148fdb29aac3a178618f88718d3d4ac91283014091aa11a01f1c70cd4e51
download   RColorBrewer     1.1-2         f3e9781e84e114b7a88eb099825936cc5ae7276bbba5af94d35adb1b3ea2ccdd
download   geneplotter      1.46.0        ba930931a39ffbe5aa243b0886844921afdf7028ab904fd50aa4edcb63e1d257
download   plyr             1.8.3         f31afae9b1998dcf806d9ec82474fac49837082e310a2c6e3ee3cbcb55ff641b
download   digest           0.6.8         3062422c2ca917e52749464d63084a0d3cc061f59083f069280ec26336ce2f55
download   gtable           0.1.2         b08ba8e62e0ce05e7a4c07ba3ffa67719161db62438b04f14343f8928d74304d
download   stringi          0.5-5         1cd67b64f287aac9e8fd95dd4a0cab829e0fb7870fd264ede281be0b65ce7ca0
download   magrittr         1.5           05c45943ada9443134caa0ab24db4a962b629f00b755ccf039a2a2a7b2c92ae8
download   stringr          1.0.0         f8267db85b83c0fc8904009719c93296934775b0d6890c996ec779ec5336df4a
download   reshape2         1.4.1         fbd49f75a5b0b7266378515af98db310cf6c772bf6e68bed01f38ee99b408042
download   dichromat        2.0-0         31151eaf36f70bdc1172da5ff5088ee51cc0a3db4ead59c7c38c25316d580dd1
download   colorspace       1.2-6         ba3165c5b906edadcd1c37cad0ef58f780b0af651f3fdeb49fbb2dc825251679
download   munsell          0.4.2         84e787f58f626c52a1e3fc1201f724835dfa8023358bfed742e7001441f425ae
download   labeling         0.3           0d8069eb48e91f6f6d6a9148f4e2dc5026cabead15dd15fc343eff9cf33f538f
download   scales           0.3.0         f4e1b98e3501b3a27b1a86ecc622a4653aff31c9f93248d7b5d428b03ebe6fce
download   proto            0.3-10        d0d941bfbf247879b3510c8ef3e35853b1fbe83ff3ce952e93d3f8244afcbb0e
download   MASS             7.3-44        835fe22547222742fa84b8bf77774432abe3dff267932b8b8ed06de554f8e79b
download   ggplot2          1.0.1         40248e6b31307787e44e45d806e7a33095844a9bbe864cc7583dd311b19c241d
download   Formula          1.2-1         5db1ef55119b299c9d291e1c5c08e2d51b696303daf4e7295c38ff5fc428360a
download   latticeExtra     0.6-26        0d1410f279d515a99c102824cc11ad2b024c86ee6af982cb45ea55739e06a09b
download   cluster          2.0.3         286671702b1ac4c4e918faa8b43cd7fe7561ce02ca5f62823be5f136d6674e0e
download   rpart            4.1-10        c5ddaed288d38118876a94c7aa5000dce0070b8d736dba12de64a9cb04dc2d85
download   nnet             7.3-11        979ed2fa4f9ec7c10e76188d41bc48f16fc90c3e59c3102714c85e53455ee54d
download   acepack          1.3-3.3       3e2c3348a9657da2097e2fca18c7ebaebc44f3acd0491216bd5104edfd1e3e8f
download   foreign          0.8-66        d7401e5fcab9ce6e697d3520dbb8475e229c30341c0004c4fa489c82aa4447a4
download   gridExtra        2.0.0         27dc76f75eb08f99a4ab0f629a016250722368528ca6b515edb0b0339acbdea7
download   Hmisc            3.16-0        4edc3903da63e25d747f34c33abf3e4e9a1f250580bbbab39fb192469738a30d
download   DESeq2           1.8.2         25fb91b73b033142069fde1413657e7ae8fbb1d801025eec4014a9760d9960ac
download   gtools           3.4.1         fa2b8351223369a13f4e922f13e8c836459a9522c775a455afd5e2b18941bb34
download   gdata            2.13.3        554c973955a5d768359f56556effff6a7acd9e859d98ab13fa010df01fa16516
download   bitops           1.0-6         9b731397b7166dd54941fb0d2eac6df60c7a483b2e790f7eb15b4d7b79c9d69c
download   caTools          1.17.1        d32a73febf00930355cc00f3e4e71357412e0f163faae6a4bf7f552cacfe9af4
download   KernSmooth       2.23-13       3f5fbda9201ea0dab4b5d30a8b857460a929502fc07e3fadc87445c746ce3fe5
download   gplots           2.14.2        8cb2ef4309f44eb049f0a8761d3b2aaf636e0ec2323942ec0c27fd8b4912abf9
download   getopt           1.20.0        f920baa2a0ef7082155c8b666851af0c77534af8b2ca0cd067e7d56fdf3ec501
download   rjson            0.2.14        93d417f4eddb6fb7d679fbabb934b155de3965cf3d3e5ab03af69af5a0123357
