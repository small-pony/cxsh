#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --prefix=dir      directory in which to install
  --include-subdir  include the cxsh-1.0.0-Linux subdirectory
  --exclude-subdir  exclude the cxsh-1.0.0-Linux subdirectory
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "cxsh Installer Version: 1.0.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage 
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version 
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'

____cpack__here_doc____
    echo
    echo "Do you accept the license? [yN]: "
    read line leftover
    case ${line} in
      y* | Y*)
        cpack_license_accepted=TRUE;;
      *)
        echo "License not accepted. Exiting ..."
        exit 1;;
    esac
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the cxsh will be installed in:"
    echo "  \"${toplevel}/cxsh-1.0.0-Linux\""
    echo "Do you want to include the subdirectory cxsh-1.0.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/cxsh-1.0.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +145 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the cxsh-1.0.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;

� � �^ �[l[�>��6i�-M�6��GEJ�k'q�º�I�ڭ��<� �[Ǿi~��"Ei;<�:6u�M�`ĺiBLB#Ѝ�&��`CLQ���:���x��s��{��@�44���?�w��y�s����@4�]��t:[�n;��V�SK�dw5������V���jjmlBv���IiI�pU�x(N&������C�ߐ4��?<"]J���VWn�]�Mx��[���y)+��|���ךM&���o#�M�S���hV�6�A��jGuh�K5r<=g��2�B%��1S��K���4��"���JO�%葺��|�]G�ʎ����L��;���X}�B�Jد��<�Dz
n�O��_ZIy�F����MXo����h�W�_��0+cс�敱HC,�H�4�xZZ�R�Ѩ���d�u�+�ЏvV��$)�[�_z��x��������~'�J�7l��0��Wt��>�^W �������4�{�����߫���9T �ۙ�j�N;�b����*ɑ��d,[� �'Y$eA@���B��+*�b�#�$QBB�o�S���K&ľ�@L�e�%7w�ʞhRB��HD�N�o��'c��{mOo�W�a�Wn�X �+�\�PJ�S��,�>_ƚ��hXHJrJ�}B�S���F>:��^9&���p6��7�iU�ɴLz)N;�v�ÂD8���qᑐ�ő�̘�h"�ޅ�.9֩�P4���B������[�&G3���+�"?�3#�����Sn���Dˉĝl<M�_�~��*#VFa��}���J�8�����8|��5��٩���UP�����p�O���G���_2��Ï1|+�?���Ç8�E�s�+��7����a��!��9��s��?��%l��9�[�f���O�QJ���[n�7k��D�����ϥ�|�����������i�
�yG���5'>-ܮ�����L�;5�\�=]��4�Ў��'ds���e�Q��8��ˎ�kU]�^yݞ:��i٣�']=uB��t�Ԅ����S�����_�ǁ��;����������>�u�c�W+du�����ڎ>���T��H�J	��/?�Ϝ򏞳����K5�~����AE~�qR�AGU�>�α��}��?M�_���3g�/L��^�>-�`cf�������������?�Z�
�d�\�p�㘛��-������J'���l~}���~Fנ�ܩX����Z@�O��ۧ�p)�O�)���&�O��f�����D-�?���0�,�u��M�m�{�g��F�9oJ7�Ϲl�}96�Wn����\�t�|�O��{/O�ǅ�*��@Ԟ'c>y���Zs�V��1y����Ӥ�O^P�S�?�V�~~����~ǽ[������ߋ�βOldL��1�d>d�
.?���.X&?�?����C�33�ub���G�����MD��-۽�z�{wx����:{��+��A�2O�X,i���]t T{�3�/M��R��ʵI�6+W�rmQ���ꊃ��s��F5פ�՜[͵�9l�$S��Ɲ�>�<��>��#����QL���M�%���G��k��^��m�1%�*��k�>���>�i��OM�=X�uW2��L����M�m'�>v�g�f�1�G�&?�E6�M���֚�Us�,ۋ�,��k�}���,�ӮkD�V�;��y���;*gI�+'�=���rs�"@�ÿ+qTk˻s����B\�D[ޟ+�l
�?��
�'mZ�����ER�n�4�[k������vk�C�~���,��3:{��-e�x�N����j�rX��Z��O�ي�h�s�TL�TL�TL�TL�TL�TL���N��6ĳ����A�����84ĝ!�qe�#C����80�}!�q]��B�V���ך����װ�J�,�
1R�,f<��2���%��r؟�X¿��IB��g���Xpb���� ��T�_5�'5v������Q��@ly��ez*��d� ��������4�'Xò��z�a�V��/D��	�����u�F���z9�7X��q���S���G����򬈈�Ү��7:]�N��e�:Y��_ȾW�!nA�!^��C=^��?=>K��z|�:�z�L�z�\���s�y������@;�Jt����6�x�z�q�k��S����h�!~Y_��z����~�_d8O-�.��*=�X]���1�s��z|iF����,�W(e��"���n\j��3��ϟN�~-�Үփ�^%���w1;���|�x��@��V�mh�'��UV�;�����ֳ�<��2��9�:��^��~S��e&�_��߼���~�*����^������7of8��,0��o����~��p~��^����1��o>�p~��	�����0��o>�p~��M�����1��o��p���d�a����j3)������f����RY��׷v�N���U��,���2����V��W/[�����g���ϱ�a6���g�a=�=��-�T���Ϛ���[ ?_ _h1�o��gK��,dTr�#x����?Yș���|�b|>�b߼�9��-���P�6N��:.�"-2|�D�l>�{���Գ6�o�L�+��%���� ~���o����{^��1x��dIN:�H�w��@o� ���.A�ar�K����+�ń��LIB(=����pL�ň�eUk��9B�Th� &��4�
�E!����`'`IY'J*;����A��k�pT�wF%Q'��J�eZ��h��c��%��Vr4���#X�K&�P""DD�Gxg4��u�M�� VIz8�cn��_��Oɵ�H���ש �z|�.�k��7m!���`?9�l��]����*`�6�"����)ū�7;U���cf�մ�I؜}գ>\.�i)��L1��)������="��S�rNNX����|]���2- ���_������G5�i�Z�CB��=�#��Q���:�uy7:�\\XJ+��K>4>��֦=E�wގ�wڣz\��!E����?~�����M��hBHKb�bg*�HHA����-�z0�p��ﳈ������ځ�w�0 I��;�ə�ڧ79;"i^O�=q94����tr��a�H$e��m4ȡ]�ەH;��X�!A
7���#�'��Q*�h	��:F�e)1"�,7��K�$�ؕ�<��U���TR��Cbk�P$��*���oc1�J�`+J�B�h�-��� 9�]�G�'�WK�{�<�����y|H&����
�����<������{�53��ϲ�$��w�aN>����.DcO���ݬ�p.�!N����C�A����ہh,	�!� ��o���Ʀ����i��ߌ��O�K4������ڿ��3�@wj��@�a�=럋O�8$~�3�>�M�vs�6�>��C|(�_<�cN�ہ���7��,�)���@��5���@��ޣ��p��p���蘿���J=}���|���z�V�����BI'_�ѷ�J��k5�����c�}���Ϡ�CN��L����":����?#����� }�G�9����|[�@�s��w0#��PH�Ԥׇ�2�]_O^�\�@���L���?vN�����3�n��bt�o�鏳�
�[��ׯrMݵ��:J��n~��W@��J���(�b*�b����{�& @  