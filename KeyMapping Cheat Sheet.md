## Neo Vim Binds

- **Space:** No operation (Nop) in normal and visual mode
- **k:** Move to the previous line (gk if count is 0)
- **j:** Move to the next line (gj if count is 0)

## Save and Close Binds

- **Ctrl + S:** Save the current file
- **Ctrl + Q:** Close the current buffer

## Buffer Navigation Binds

- **Ctrl + N:** Go to the next open buffer
- **Ctrl + P:** Go to the previous open buffer

## Terminal Mode Bind

- **Ctrl + X:** Move cursor to the split window on the left

## Move Line Binds

- **Alt + j:** Move the current line down
- **Alt + k:** Move the current line up
- **[Visual Mode] Alt + j:** Move the selected lines down
- **[Visual Mode] Alt + k:** Move the selected lines up

## Harpoon Binds

- **Leader + a:** Append buffer to the Harpoon list
- **Ctrl + E:** Toggle quick menu for Harpoon list
- **Alt + 1:** Go to the first buffer in the Harpoon list
- **Alt + 2:** Go to the second buffer in the Harpoon list
- **Alt + 3:** Go to the third buffer in the Harpoon list
- **Alt + 4:** Go to the fourth buffer in the Harpoon list
- **Ctrl + Shift + P:** Go to the previous buffer in the Harpoon list
- **Ctrl + Shift + N:** Go to the next buffer in the Harpoon list

## Oil Bind

- **-:** Open the parent directory using Oil

## Telescope Binds

- **Leader + ff:** Find files using Telescope
- **Leader + fg:** Live grep using Telescope
- **Leader + fb:** Find open buffers using Telescope

## Trouble Binds

- **Leader + xx:** Toggle the Trouble plugin
- **Leader + xw:** Toggle workspace diagnostics in Trouble
- **Leader + xd:** Toggle document diagnostics in Trouble
- **Leader + xq:** Toggle quickfix in Trouble
- **Leader + xl:** Toggle location list in Trouble
- **gR:** Toggle LSP references in Trouble

## LSP Config Binds

- **gR:** Show LSP references using Telescope
- **F:** Format the current file using LSP

## LSP Navigation Binds

- **gD:** Go to declaration using LSP
- **gd:** Show LSP definitions using Telescope
- **gi:** Show LSP implementations using Telescope
- **gt:** Show LSP type definitions using Telescope

## LSP Code Actions Binds

- **Leader + ca:** See available code actions using LSP

## LSP Rename and Diagnostics Binds

- **Leader + rn:** Perform a smart rename using LSP
- **Leader + D:** Show buffer diagnostics using Telescope
- **Leader + d:** Show line diagnostics using Vim's diagnostics

## LSP Diagnostic Navigation Binds

- **[d:** Go to the previous diagnostic
- **]d:** Go to the next diagnostic

## LSP Hover and Restart Binds

- **K:** Show documentation for what is under the cursor using LSP
- **Leader + rs:** Restart LSP