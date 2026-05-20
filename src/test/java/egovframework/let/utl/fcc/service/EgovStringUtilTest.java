package egovframework.let.utl.fcc.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class EgovStringUtilTest {

	@Test
	void testIsEmpty() {
		assertTrue(EgovStringUtil.isEmpty(null));
		assertTrue(EgovStringUtil.isEmpty(""));
		assertFalse(EgovStringUtil.isEmpty(" "));
		assertFalse(EgovStringUtil.isEmpty("abc"));
	}

	@Test
	void testRemove() {
		assertNull(EgovStringUtil.remove(null, 'a'));
		assertEquals("", EgovStringUtil.remove("", 'a'));
		assertEquals("qeed", EgovStringUtil.remove("queued", 'u'));
		assertEquals("queued", EgovStringUtil.remove("queued", 'z'));
	}

	@Test
	void testRemoveCommaChar() {
		assertNull(EgovStringUtil.removeCommaChar(null));
		assertEquals("", EgovStringUtil.removeCommaChar(""));
		assertEquals("asdfgqweqe", EgovStringUtil.removeCommaChar("asdfg,qweqe"));
	}

	@Test
	void testRemoveMinusChar() {
		assertNull(EgovStringUtil.removeMinusChar(null));
		assertEquals("", EgovStringUtil.removeMinusChar(""));
		assertEquals("asdfgqweqe", EgovStringUtil.removeMinusChar("a-sdfg-qweqe"));
	}

	@Test
	void testCutString() {
		assertNull(EgovStringUtil.cutString(null, 5));
		assertEquals("abc", EgovStringUtil.cutString("abc", 5));
		assertEquals("ab", EgovStringUtil.cutString("abcde", 2));

		assertNull(EgovStringUtil.cutString(null, "...", 5));
		assertEquals("abc", EgovStringUtil.cutString("abc", "...", 5));
		assertEquals("ab...", EgovStringUtil.cutString("abcde", "...", 2));
	}

}
