.global lab1
.syntax unified

lab1:
    push {lr}         // Збереження адреси повернення

    mov r0, #20       // a = 20
    mov r1, #9        // b = 9
    mov r2, #5        // c = 5

    sub r3, r0, r1    // r3 = a - b
    cmp r3, #0        // Порівняння (a - b) з 0
    blt perform_div   // Якщо (a - b) < 0, переходимо до ділення

    add r3, r0, r1    // r3 = a + b (якщо a - b >= 0)

perform_div:
    bl division       // Виклик функції ділення
    mov r5, r0        // Збереження результату у r5

    pop {pc}          // Повернення

// Функція цілочисельного ділення r3 / c
division:
    push {lr}         // Збереження адреси повернення
    sdiv r0, r3, r2   // r0 = r3 / c
    pop {pc}          // Повернення
