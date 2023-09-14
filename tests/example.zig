pub const VkAttachmentLoadOp = enum(i32) {
    VK_ATTACHMENT_LOAD_OP_LOAD = 0,
    VK_ATTACHMENT_LOAD_OP_CLEAR = 1,
    VK_ATTACHMENT_LOAD_OP_DONT_CARE = 2,
};

pub const StructForNoReason = extern struct {
    flags: i32,
    format: [*]void,
    stencilLoadOp: VkAttachmentLoadOp,
};
