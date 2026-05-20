package egovframework.let.utl.fcc.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class EgovNumberUtilTest {

	@Test
	void testGetRandomNum() {
		int start = 10;
		int end = 20;
		for (int i = 0; i < 50; i++) {
			int rand = EgovNumberUtil.getRandomNum(start, end);
			assertTrue(rand >= start && rand <= end);
		}
	}

	@Test
	void testGetNumSearchCheck() {
		assertTrue(EgovNumberUtil.getNumSearchCheck(12345678, 7));
		assertFalse(EgovNumberUtil.getNumSearchCheck(12345678, 9));
	}

	@Test
	void testGetNumToStrCnvr() {
		assertEquals("20081212", EgovNumberUtil.getNumToStrCnvr(20081212));
		assertEquals("0", EgovNumberUtil.getNumToStrCnvr(0));
	}

	@Test
	void testGetNumToDateCnvr() {
		assertEquals("2008-12-12", EgovNumberUtil.getNumToDateCnvr(20081212));
		assertThrows(IllegalArgumentException.class, () -> {
			EgovNumberUtil.getNumToDateCnvr(123456);
		});
	}

	@Test
	void testGetNumberValidCheck() {
		assertTrue(EgovNumberUtil.getNumberValidCheck("12345"));
		assertFalse(EgovNumberUtil.getNumberValidCheck("12a45"));
	}

	@Test
	void testGetNumberCnvr() {
		assertEquals(99945678, EgovNumberUtil.getNumberCnvr(12345678, 123, 999));
	}

}
