.global lab1
.syntax unified

lab1:
    push {lr}         // Збереження адреси повернення

    mov r0, #10       // a = 10
    mov r1, #3        // b = 3

    tst r0, #1        // Перевірка, чи a парне (a & 1)
    bne odd_case      // Якщо a непарне, переходимо до odd_case

    // Якщо a парне: (a >> 1) + (b << 2)
    mov r2, r0, asr #1   // r2 = a >> 1 (поділ на 2)
    mov r3, r1, lsl #2   // r3 = b << 2 (множення на 4)
    add r4, r2, r3       // r4 = (a >> 1) + (b << 2)
    b end_case           // Переходимо до завершення

odd_case:
    // Якщо a непарне: (a << 1) - (b >> 2)
    mov r2, r0, lsl #1   // r2 = a << 1 (множення на 2)
    mov r3, r1, asr #2   // r3 = b >> 2 (поділ на 4)
    sub r4, r2, r3       // r4 = (a << 1) - (b >> 2)

end_case:
    mov r5, r4        // Збереження результату у r5
    pop {pc}          // Повернення
