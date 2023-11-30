"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
     */
    await queryInterface.bulkInsert("Categories", [
      {
        name: "NORTH INDIAN",
      },
      {
        name: "SOUTH INDIAN",
      },
      {
        name: "CONTINENTAL",
      },
      {
        name: "CHINESE",
      },
    ]);

    await queryInterface.bulkInsert("Tables", [
      {
        name: "PATIO 1",
      },
      {
        name: "PATIO 2",
      },
      {
        name: "PATIO 3",
      },
      {
        name: "INTERIOR 1",
      },
      {
        name: "INTERIOR 2",
      },
      {
        name: "BARRA 1",
      },
    ]);

    await queryInterface.bulkInsert("Clients", [
      {
        name: "Jose Morinho",
        address: "Venice, Italy",
        email: "jose2morinho@example.com",
        phone: "1234567890",
        dni: "56754322",
      },
      {
        name: "John Doe",
        address: "Barrio Centro, Rivadavia 1030",
        email: "johndoe@example.com",
        phone: "3804123123",
        dni: "40123123",
      },
      {
        name: "Amrinder Singh",
        address: "Patiala, Punjab",
        email: "amrinder.singh@gmail.com",
        phone: "9876543210",
        dni: "78754564",
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    await queryInterface.bulkDelete("Categories", null, {});

    await queryInterface.bulkDelete("Tables", null, {});

    await queryInterface.bulkDelete("Clients", null, {});
  },
};
