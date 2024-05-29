dnl #
dnl # Linux 3.11 has three parameters for invalidate_page
dnl #
AC_DEFUN([ZFS_AC_KERNEL_SRC_VFS_INVALIDATE_PAGE_WITH_LEN], [
	ZFS_LINUX_TEST_SRC([vfs_has_invalidate_page_with_len], [
		#include <linux/fs.h>

		static void
		test_invalidate_page(struct page *page, unsigned int offset,
		                     unsigned int len) {
			(void) page; (void) offset; (void) len;
			return;
		}

		static const struct address_space_operations
		    aops __attribute__ ((unused)) = {
			.invalidate_page	= test_invalidate_page,
		};
	],[])
])

AC_DEFUN([ZFS_AC_KERNEL_VFS_INVALIDATE_PAGE_WITH_LEN], [
	dnl #
	dnl # Linux 3.11 has three parameters for invalidate_page
	dnl #
	AC_MSG_CHECKING([whether invalidate_page has len])
	ZFS_LINUX_TEST_RESULT([vfs_has_invalidate_page_with_len], [
		AC_MSG_RESULT([yes])
		AC_DEFINE(HAVE_VFS_INVALIDATE_PAGE_WITH_LEN, 1, [invalidate_page has len])
	],[
		AC_MSG_RESULT([no])
	])
])
