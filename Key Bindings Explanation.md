# Key Bindings Explanation

## Neo Vim Binds

- `<Space>` in normal and visual mode: No operation (Nop), silent.
- `k` in normal mode: If count is 0, go to `gk`, otherwise, go to `k`, silent.
- `j` in normal mode: If count is 0, go to `gj`, otherwise, go to `j`, silent.
- `<C-s>` in normal mode: Save the current file.
- `<C-Q>` in normal mode: Close the current buffer.
- `<C-N>` in normal mode: Go to the next open buffer.
- `<C-P>` in normal mode: Go to the previous open buffer.
- `<C-X>` in terminal mode: Move the cursor to the split window on the left.
- `<A-j>` in normal mode: Move the current line down.
- `<A-k>` in normal mode: Move the current line up.

## Harpoon Binds

- `<leader>a` in normal mode: Append the current buffer to the Harpoon buffer list.
- `<C-e>` in normal mode: Toggle the quick menu to show the Harpoon buffer list.
- `<A-1>` to `<A-4>` in normal mode: Go to the first to fourth buffer in the Harpoon list.
- `<C-S-P>` in normal mode: Go to the previous buffer in the Harpoon list.
- `<C-S-N>` in normal mode: Go to the next buffer in the Harpoon list.

## Cmp Binds

- `<C-k>`: Select the previous suggestion.
- `<C-j>`: Select the next suggestion.
- `<C-b>`: Scroll documentation up.
- `<C-f>`: Scroll documentation down.
- `<C-Space>`: Show completion suggestions.
- `<C-e>`: Close the completion window.
- `<Ck>`: Confirm the selected item.

## Oil Bind

- `-` in normal mode: Open the parent directory using Oil.

## Telescope Binds

- `<leader>ff` in normal mode: Find files using Telescope.
- `<leader>fg` in normal mode: Live grep using Telescope.
- `<leader>fb` in normal mode: Find open buffers using Telescope.

## Lsp config Binds

- `gR` in normal mode: Show LSP references using Telescope.
- `F` in normal mode: Format the current file.
- `gD` in normal mode: Go to declaration.
- `gd` in normal mode: Show LSP definitions using Telescope.
- `gi` in normal mode: Show LSP implementations using Telescope.
- `gt` in normal mode: Show LSP type definitions using Telescope.
- `<leader>ca` in normal and visual mode: See available code actions.
- `<leader>rn` in normal mode: Smart rename.
- `<leader>D` in normal mode: Show buffer diagnostics using Telescope.
- `<leader>d` in normal mode: Show line diagnostics using Vim's diagnostics.
- `[d` in normal mode: Go to the previous diagnostic.
- `]d` in normal mode: Go to the next diagnostic.
- `K` in normal mode: Show documentation for what is under the cursor.
- `<leader>rs` in normal mode: Restart LSP.
- `<C-f>` in normal mode: Format the current buffer.
