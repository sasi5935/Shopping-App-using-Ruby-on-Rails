module FiltersHelper
    def all_shapes
        Cushion.pluck(:shape)&.uniq
    end

    def all_emoji_types
        Cushion.pluck(:emoji_type)&.uniq
    end
end