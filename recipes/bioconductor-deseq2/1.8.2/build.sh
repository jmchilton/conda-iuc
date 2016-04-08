#!/bin/sh

# For whatever reason, it can't link to gsl correctly without this on OS X.
export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib:$(HOME)/lib:/usr/local/lib:/lib:/usr/lib

download(){
    URL=$1
    PV=$2
    PACKAGE=$3
    SHA256=$4
    
    wget --no-check-certificate ${URL}
    
    sha256sum ${PV} | awk '{ if ($1 == "'${SHA256}'") exit 0; else exit 1}'
    tar xfz ${PV}
    cd ${PACKAGE}
    mv DESCRIPTION DESCRIPTION.old
    grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
    $R CMD INSTALL --build .
    cd .. && rm -rf ${PACKAGE}
}

download_noarch(){
    PACKAGE=$1
    VERSION=$2
    SHA256=$3
    
    PV=${PACKAGE}_${VERSION}.tar.gz
    
    download https://depot.galaxyproject.org/package/noarch/${PV} ${PV} ${PACKAGE} ${SHA256}
}

download_noarch   BiocGenerics     0.12.1        d451f2c72c46a7b5fa6dd252a207ba72f0a5a86d1bfc95408935f079efa85f77
download_noarch   S4Vectors        0.4.0         8a696633faf34458580ca851a77eb55cfa60e454a5412216c8dd3c19fac46b78
download_noarch   IRanges          2.0.1         6c26fcb89570f869fe476688d59e99f4c4eb8358a4f8a16d00f77ab04a9c3db9
download_noarch   GenomeInfoDb     1.2.4         459d8904e30999435f7dd2ce40fc9a1b076982f798a6d2fb752d0311a7bcbd4b
download_noarch   XVector          0.6.0         ea61b364a647b590a566c69429e9eb9d10296825bac2d8168881dd8404d8ba14
download_noarch   GenomicRanges    1.18.4        1ff768364df263f7c55b31488b8718f173ae06f4d3bc6f49d4f24ccf300f4aa9
download_noarch   Rcpp             0.11.3        0abeaeb109f4964f098e22a569a6f72cffb5aeed9d8e67db2ba6628c6a4a124c

download https://depot.galaxyproject.org/software/RcppArmadillo/RcppArmadillo_0.5.500.2.0_src_all.tar.gz RcppArmadillo_0.5.500.2.0_src_all.tar.gz RcppArmadillo f30155fdd4745b4c9a548a25a30b6ae5fe3e3f6cf4136ac485a75c90555934a0

download_noarch   Biobase          2.26.0        c481a23e57762d969b225d0fa2e72cbe72e0ce037422d89bafcc8b7527561b9c

download https://depot.galaxyproject.org/software/lambda.r/lambda.r_1.1.7_src_all.tar.gz lambda.r_1.1.7_src_all.tar.gz lambda.r 8ae36527124752f7af01eb84a55fa77716226b0e76dd03966b83d9583dcfbfd3
download https://depot.galaxyproject.org/software/futile.options/futile.options_1.0.0_src_all.tar.gz futile.options_1.0.0_src_all.tar.gz futile.options ee84ece359397fbb63f145d11af678f5c8618570971e78cc64ac60dc0d14e8c2
download https://depot.galaxyproject.org/software/futile.logger/futile.logger_1.4.1_src_all.tar.gz futile.logger_1.4.1_src_all.tar.gz futile.logger a1e485e943d288b92a2af3337b333be95d1b51246dd14be9f18ae5ce626894de
download https://depot.galaxyproject.org/software/snow/snow_0.3-13_src_all.tar.gz snow_0.3-13_src_all.tar.gz snow ceb6af66f8c988a7606c4ba2d7ccf84c14bca6c376f8d9133089296607c14bc1

download_noarch   BiocParallel     1.0.3         339c7c8285637afafa0f3ca3d429ef002df5da1653490984cd64662f7cabf71f
download_noarch   DBI              0.3.1         1c26535720f146fae8cc9ef6e190619967abf296706a5b5a1e8242cbbb5a4576
download_noarch   RSQLite          1.0.0         8e0cfca19afbc61f40c6d86018cd723a7e00f16d0944c4637f07a18fb6d76121
download_noarch   AnnotationDbi    1.28.1        214a293286af854001ce46b9d866ea5b3fbc4e6b8383be0952f63491e4f6171c
download_noarch   XML              3.98-1.1      947318e0e0d272bcd57244999d897d6f7b2624554fdf451f8c3c0461c8313159
download_noarch   xtable           1.7-4         47629a31185591be30b13ae3a656fc24360760996975e292f4fa7954c0257dbb
download_noarch   annotate         1.44.0        c191767f5876f8e44a82779749237e91f1e99b3dc6b8e93fe7a8c3e43d91b3ca
download_noarch   survival         2.37-7        658d2c5825d62ac4d2be1631cfc848f1424d894948840f8b5406f0259f201ac6
download_noarch   genefilter       1.48.1        31356f8eabecd6b4fe6124edcf9cd6b258481ff124061d709f49cb10f29691f6
download_noarch   lattice          0.20-31       61bdd89b85979b68a0546ea6910cdc096939922f936b29cbd41ab51f5e1e75ac

download https://depot.galaxyproject.org/software/locfit/locfit_1.5-9.1_src_all.tar.gz locfit_1.5-9.1_src_all.tar.gz locfit f524148fdb29aac3a178618f88718d3d4ac91283014091aa11a01f1c70cd4e51

download_noarch   RColorBrewer     1.1-2         f3e9781e84e114b7a88eb099825936cc5ae7276bbba5af94d35adb1b3ea2ccdd

download https://depot.galaxyproject.org/software/geneplotter/geneplotter_1.46.0_src_all.tar.gz geneplotter_1.46.0_src_all.tar.gz geneplotter ba930931a39ffbe5aa243b0886844921afdf7028ab904fd50aa4edcb63e1d257

download_noarch   plyr             1.8.1         95393c61e7c066450ab76eb667e28e763c04a0afb9d6e4d3b397ba93efb04a38
download_noarch   digest           0.6.8         3062422c2ca917e52749464d63084a0d3cc061f59083f069280ec26336ce2f55
download_noarch   gtable           0.1.2         b08ba8e62e0ce05e7a4c07ba3ffa67719161db62438b04f14343f8928d74304d

download https://depot.galaxyproject.org/software/stringi/stringi_0.5-5_src_all.tar.gz stringi_0.5-5_src_all.tar.gz stringi 1cd67b64f287aac9e8fd95dd4a0cab829e0fb7870fd264ede281be0b65ce7ca0
download https://depot.galaxyproject.org/software/magrittr/magrittr_1.5_src_all.tar.gz magrittr_1.5_src_all.tar.gz magrittr 05c45943ada9443134caa0ab24db4a962b629f00b755ccf039a2a2a7b2c92ae8

download_noarch   stringr          0.6.2         c3fc9c71d060ad592d2cfc51c36ab2f8e5f8cf9a25dfe42c637447dd416b6737
download_noarch   reshape2         1.4.1         fbd49f75a5b0b7266378515af98db310cf6c772bf6e68bed01f38ee99b408042
download_noarch   dichromat        2.0-0         31151eaf36f70bdc1172da5ff5088ee51cc0a3db4ead59c7c38c25316d580dd1
download_noarch   colorspace       1.2-4         d09cda442d61c9f70631c5024013e67596a2da134ca722d30ab2494c199bfbde
download_noarch   munsell          0.4.2         84e787f58f626c52a1e3fc1201f724835dfa8023358bfed742e7001441f425ae
download_noarch   labeling         0.3           0d8069eb48e91f6f6d6a9148f4e2dc5026cabead15dd15fc343eff9cf33f538f
download_noarch   scales           0.2.4         5ba490c0a00909196b021336d636863c13b10ea8ea06a33b3701ae8862f4b921
download_noarch   proto            0.3-10        d0d941bfbf247879b3510c8ef3e35853b1fbe83ff3ce952e93d3f8244afcbb0e

download https://depot.galaxyproject.org/software/MASS/MASS_7.3-44_src_all.tar.gz MASS_7.3-44_src_all.tar.gz MASS 835fe22547222742fa84b8bf77774432abe3dff267932b8b8ed06de554f8e79b

download_noarch   ggplot2          1.0.0         e6effb8065f030903c760ee238c8890ce85e462fe3c12a5521a983fcd1ed198d ggplot2_1.0.0.tar.gz
download_noarch   Formula          1.1-2         20a812a8620f610e5242402f6b3437287b26e3e4fb30e9b22d27884e7c65b2ab
download_noarch   latticeExtra     0.6-26        0d1410f279d515a99c102824cc11ad2b024c86ee6af982cb45ea55739e06a09b

download https://depot.galaxyproject.org/software/cluster/cluster_2.0.3_src_all.tar.gz cluster_2.0.3_src_all.tar.gz cluster 286671702b1ac4c4e918faa8b43cd7fe7561ce02ca5f62823be5f136d6674e0e
download https://depot.galaxyproject.org/software/rpart/rpart_4.1-10_src_all.tar.gz rpart_4.1-10_src_all.tar.gz rpart c5ddaed288d38118876a94c7aa5000dce0070b8d736dba12de64a9cb04dc2d85
download https://depot.galaxyproject.org/software/nnet/nnet_7.3-11_src_all.tar.gz nnet_7.3-11_src_all.tar.gz nnet 979ed2fa4f9ec7c10e76188d41bc48f16fc90c3e59c3102714c85e53455ee54d

download_noarch   acepack          1.3-3.3       3e2c3348a9657da2097e2fca18c7ebaebc44f3acd0491216bd5104edfd1e3e8f

download https://depot.galaxyproject.org/software/foreign/foreign_0.8-66_src_all.tar.gz foreign_0.8-66_src_all.tar.gz foreign d7401e5fcab9ce6e697d3520dbb8475e229c30341c0004c4fa489c82aa4447a4
download https://depot.galaxyproject.org/software/gridExtra/gridExtra_2.0.0_src_all.tar.gz gridExtra_2.0.0_src_all.tar.gz gridExtra 27dc76f75eb08f99a4ab0f629a016250722368528ca6b515edb0b0339acbdea7

download_noarch   Hmisc            3.14-6        fe26b57a356832dc098be6edca0ffd1ad5766dee9b6a0989c113d4fee3a9255b

download https://depot.galaxyproject.org/software/Hmisc/Hmisc_3.16-0_src_all.tar.gz Hmisc_3.16-0_src_all.tar.gz Hmisc 4edc3903da63e25d747f34c33abf3e4e9a1f250580bbbab39fb192469738a30d

download_noarch   gtools           3.4.1         fa2b8351223369a13f4e922f13e8c836459a9522c775a455afd5e2b18941bb34

download https://depot.galaxyproject.org/software/gdata/gdata_2.13.3_src_all.tar.gz gdata_2.13.3_src_all.tar.gz gdata 554c973955a5d768359f56556effff6a7acd9e859d98ab13fa010df01fa16516

download_noarch   bitops           1.0-6         9b731397b7166dd54941fb0d2eac6df60c7a483b2e790f7eb15b4d7b79c9d69c

download https://depot.galaxyproject.org/software/caTools/caTools_1.17.1_src_all.tar.gz caTools_1.17.1_src_all.tar.gz caTools d32a73febf00930355cc00f3e4e71357412e0f163faae6a4bf7f552cacfe9af4
download https://depot.galaxyproject.org/software/KernSmooth/KernSmooth_2.23-13_src_all.tar.gz KernSmooth_2.23-13_src_all.tar.gz KernSmooth 3f5fbda9201ea0dab4b5d30a8b857460a929502fc07e3fadc87445c746ce3fe5
download https://depot.galaxyproject.org/software/gplots/gplots_2.14.2_src_all.tar.gz gplots_2.14.2_src_all.tar.gz gplots 8cb2ef4309f44eb049f0a8761d3b2aaf636e0ec2323942ec0c27fd8b4912abf9

download_noarch   getopt           1.20.0        f920baa2a0ef7082155c8b666851af0c77534af8b2ca0cd067e7d56fdf3ec501
download_noarch   rjson            0.2.15        77d00d8f6a1c936329b46f3b8b0be79a165f8c5f1989497f942ecc53dcf6f2ef
download_noarch   Biostrings       2.34.1        b00af8f8eb1dbafa4e0ab25b571fa0a9484376c761b4de949eb6bbb7d41bd0cd
download_noarch   rtracklayer      1.26.2        c0284805d84f83f6189dc5a58461ea9ace8ec43dc301b0b317f4c3b493bf8bdb
download_noarch   biomaRt          2.22.0        980d74b48c687eb8de59753841b4b407068f08a87675729d0fe175e8cb63c55e
download_noarch   RCurl            1.95-4.5      365c582a6da2ef22f8d1bcbbeafe8478ed31de17b0890f740a3e2960620f1382
download_noarch   GenomicFeatures  1.18.3        9d9b3108b0db6e5e17b7b4cef1bca238d2124064506bcca7879e1dd53edaeeeb
