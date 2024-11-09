local widow_words = {
    "o", "i", "a", "u", "w", "z", "że", "ku", "po", "na", "do", "za", "we", "od", "ze", "się"
}

local function is_widow_word(word)
    for _, widow in ipairs(widow_words) do
        if word:lower() == widow then
            return true
        end
    end
    return false
end

-- Function to add a newline before short words
function move_short_words_to_newline(el)
    -- Process each word in the paragraph
    for i, item in ipairs(el.content) do
        if item.t == "Str" and is_widow_word(item.text) then
            -- Add a line break before short words (less than 3 characters)
            el.content[i] = pandoc.Span({ item, pandoc.RawInline("latex", "~")})
        end
    end
    return el
end

-- Apply to each paragraph block in the document
function Para(el)
    return move_short_words_to_newline(el)
end

-- Apply to each header block in the document, if needed
function Header(el)
    return move_short_words_to_newline(el)
end
