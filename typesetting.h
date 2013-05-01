#ifndef _TYPESETTING_H
#define _TYPESETTING_H

struct page_setting {
	uint32_t width;
	uint32_t height;
	uint32_t left_margin;
	uint32_t right_margin;
	uint32_t up_margin;
	uint32_t down_margin;
	uint32_t line_spacing;
	uint32_t character_spacing;
	uint32_t word_spacing;
	uint32_t max_line_length;
};

#endif
